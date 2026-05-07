; mixed program
; initialization
  LDI r3, 0x17C7B4
  LDI r14, 128
  LDI r15, 10
  IKEY r4
  CMPI r4, 109
  JNZ r4, key_0
  CALL func_1
func_1:
  SUB r12, r2, r9
  SUB r4, r3, r6
  SHL r10, r11, r5
  MOD r13, r11, r9
  MOD r2, r14, r4
  MUL r0, r6, r13
  RET
  CMP r2, r13
  JNZ r2, else_2
  SHL r1, r15, r11
  XOR r12, r10, r8
  SHR r3, r10, r7
  JMP endif_3
else_2:
  LDI r13, 2565
  LDI r12, 10
  LDI r10, 16
  WPIXEL
  LDI r8, 32
  FILL r8
  LDI r4, 2
  LDI r4, 64
  LDI r5, 0x15D7CF
  LDI r4, 128
  LDI r6, 128
  LINE r4, r4, r5, r4, r6
endif_3:
  HALT
