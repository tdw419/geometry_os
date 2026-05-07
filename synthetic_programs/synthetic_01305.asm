; mixed program
; initialization
  LDI r10, 2099
  LDI r3, 0x145CFD
  LDI r6, 1688
  LDI r4, 2194
  CALL func_0
func_0:
  AND r8, r5, r6
  MOD r12, r1, r10
  SUB r8, r11, r9
  ADD r12, r14, r2
  ADD r0, r13, r7
  XOR r13, r9, r7
  RET
  CMP r8, r14
  LDI r4, 0x3D0E58
loop_1:
  SHL r15, r0, r2
  LDI r12, 1
  SUB r4, r4, r12
  JNZ r4, loop_1
  LDI r2, 2532
  LDI r9, 2737
  LDI r5, 0xE22A3D
  TEXT r2, r9, r5, "HELLO"
  ADD r5, r0, r8
  AND r12, r7, r0
  XOR r5, r28, r6
  AND r12, r1, r13
  LDI r7, 0x92CCCB
  LDI r11, 1465
  LDI r14, 0xD52449
  LDI r2, 4
  CIRCLE r7, r11, r14, r2
  AND r17, r14, r13
  XOR r1, r3, r8
  HALT
