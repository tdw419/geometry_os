; mixed program
; initialization
  LDI r4, 0
  LDI r6, 3774
  LDI r0, 0x90850D
  LDI r10, 128
  LDI r8, 2096
  LDI r14, 1382
  LDI r7, 32
  LDI r5, 2
  CMP r4, r13
  SAR r12, r8, r0
  SHLI r0, r5, 0x3F12DC
  SHL r14, r2, r6
  SHL r9, r16, r1
  LDI r6, 32
  LDI r11, 0
  LDI r9, 2
  PSETI
  CMPI r0, 255
  LDI r9, 21
loop_0:
  ANDI r5, r3, 128
  LDI r12, 128
  LDI r8, 10
  LDI r13, 3604
  PSET r12, r8, r13
  ADDI r13, r12, 1
  LDI r12, 1
  LDI r10, 2131
  LDI r5, 0x288F4E
  WPIXEL
  LDI r10, 1
  SUB r9, r9, r10
  JNZ r9, loop_0
  CALL func_1
func_1:
  SHL r12, r8, r4
  ADD r7, r14, r12
  XOR r3, r2, r8
  MOD r10, r11, r7
  DIV r2, r0, r10
  SUB r0, r2, r3
  RET
  CMPI r9, 128
main_2:
  MUL r3, r10, r0
  LDI r3, 128
  LDI r10, 0x563B49
  LDI r4, 32
  PSETI
  IKEY r12
  CMPI r12, 4
  JNZ r12, key_3
  XOR r14, r0, r9
  AND r15, r0, r2
  XOR r0, r14, r5
  AND r3, r12, r7
  LDI r8, 0x1A6187
  LDI r2, 0xD3AF31
  LDI r7, 736
  LDI r0, 1533
  LDI r9, 0x5E70AD
  RECTF r8, r2, r7, r0, r9
  CMPI r6, 18
  FRAME
  JMP main_2
