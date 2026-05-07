; mixed program
; initialization
  LDI r27, 2
  LDI r9, 2048
  LDI r14, 0x350705
  LDI r15, 255
  LDI r11, 782
  LDI r8, 2385
  MUL r31, r10, r7
  CALL func_0
func_0:
  MOD r9, r5, r14
  SHR r0, r6, r14
  XOR r1, r15, r13
  DIV r5, r11, r10
  SUB r3, r29, r14
  DIV r12, r15, r8
  RET
  LDI r3, 16
loop_1:
  MOD r12, r16, r14
  SUBI r10, r8, 32
  SHL r7, r12, r9
  ANDI r11, r9, 1
  LDI r14, 1
  SUB r3, r3, r14
  JNZ r3, loop_1
  IKEY r12
  CMPI r12, 65
  JNZ r12, key_2
  HALT
