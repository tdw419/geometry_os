; mixed program
; initialization
  LDI r2, 2676
  LDI r0, 1505
  LDI r4, 0x667045
  LDI r10, 4
  LDI r13, 32
  LDI r6, 0xBC3602
  LDI r12, 1838
; palette
  LDI r7, 0x20CD
  LDI r14, 1
  LDI r5, 0x444444
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x44FF00
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xFF8800
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x0000FF
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xFF0000
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x888800
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xFFFF00
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x00FF44
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x00FF00
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x000000
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xFFAA00
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x00AAFF
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x444444
  STORE r7, r5
  ADD r7, r7, r14
  IKEY r7
  CMPI r7, 8
  JNZ r7, key_0
  LDI r12, 0x69C841
loop_1:
  ANDI r6, r13, 8
  LDI r11, 702
  LDI r4, 3256
  LDI r12, 2099
  LDI r1, 0x783D23
  CIRCLE r11, r4, r12, r1
  LDI r11, 1
  SUB r12, r12, r11
  JNZ r12, loop_1
  CALL func_2
func_2:
  ADD r12, r4, r17
  XOR r5, r10, r4
  SUB r13, r3, r4
  AND r8, r13, r10
  AND r4, r14, r5
  ADD r5, r13, r15
  RET
  AND r15, r3, r4
  LDI r9, 0x562AC3
  LDI r8, 1739
  LDI r0, 3411
  PSET r9, r8, r0
  LDI r3, 255
  LDI r19, 868
  LDI r4, 0xEBA3AE
  LDI r15, 47
  LDI r1, 2661
  RECTF r3, r19, r4, r15, r1
  HALT
