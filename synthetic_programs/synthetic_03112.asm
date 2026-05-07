; drawing loop program
; initialization
  LDI r4, 3307
  LDI r8, 0x160BEC
  LDI r1, 8
  LDI r7, 3926
  LDI r9, 3137
; palette
  LDI r7, 0x700F
  LDI r15, 1
  LDI r5, 0x0000CC
  STORE r7, r5
  ADD r7, r7, r15
  LDI r5, 0x880088
  STORE r7, r5
  ADD r7, r7, r15
  LDI r5, 0x0000CC
  STORE r7, r5
  ADD r7, r7, r15
  LDI r5, 0x00FFAA
  STORE r7, r5
  ADD r7, r7, r15
  LDI r5, 0x0000FF
  STORE r7, r5
  ADD r7, r7, r15
  LDI r5, 0x0044FF
  STORE r7, r5
  ADD r7, r7, r15
  LDI r5, 0x000000
  STORE r7, r5
  ADD r7, r7, r15
main_0:
  AND r6, r12, r9
  OR r11, r1, r7
  OR r12, r14, r1
  XOR r13, r7, r31
  AND r6, r10, r1
  XOR r19, r3, r8
  XOR r15, r9, r8
  FRAME
  JMP main_0
