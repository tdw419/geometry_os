; mixed program
; initialization
  LDI r21, 3929
  LDI r12, 322
  LDI r7, 0x50FA89
  LDI r6, 0x413EBA
  LDI r0, 2565
  LDI r3, 81
  CMPI r2, 110
  LDI r11, 0x820x24C6676
  STORE r11, r9
  LOAD r15, r11
  LDI r6, 1673
  STORE r6, r1
  LOAD r4, r6
  LDI r7, 0
loop_0:
  OR r2, r3, r14
  CMPI r4, r14, 33
  CMPI r13, r5, 26
  ANDI r6, r3, 106
  LDI r2, 1
  SUB r7, r7, r2
  JNZ r7, loop_0
  AND r6, r0, r15
  OR r6, r8, r4
  XOR r11, r5, r3
  LDI r6, 0x4732BA
loop_1:
  MOD r6, r31, r3
  SUBI r0, r14, 16
  ANDI r0, r1, 167
  LDI r5, 1
  SUB r6, r6, r5
  JNZ r6, loop_1
  LDI r4, 16
loop_2:
  XOR r3, r8, r14
  ANDI r9, r8, 0x4DC4FD
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_2
  CALL func_3
func_3:
  ADD r4, r14, r3
  DIV r10, r15, r4
  RET
  HALT
