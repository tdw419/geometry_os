; drawing loop program
; initialization
  LDI r1, 64
  LDI r24, 3354
  LDI r15, 2642
  LDI r9, 0xF1D69E
; palette
  LDI r6, 0x60D8
  LDI r5, 1
  LDI r2, 0x0044FF
  STORE r6, r2
  ADD r6, r6, r5
  LDI r2, 0x444444
  STORE r6, r2
  ADD r6, r6, r5
  LDI r2, 0x00FFFF
  STORE r6, r2
  ADD r6, r6, r5
  LDI r2, 0xDD0044
  STORE r6, r2
  ADD r6, r6, r5
  LDI r2, 0x550077
  STORE r6, r2
  ADD r6, r6, r5
  LDI r2, 0x000066
  STORE r6, r2
  ADD r6, r6, r5
  LDI r2, 0xDD0044
  STORE r6, r2
  ADD r6, r6, r5
  LDI r2, 0x880088
  STORE r6, r2
  ADD r6, r6, r5
  LDI r2, 0xAAAAAA
  STORE r6, r2
  ADD r6, r6, r5
main_0:
  ADD r12, r2, r10
  LDI r2, 1394
  LDI r5, 0xF93A3D
  LDI r4, 32
  DRAWTEXT r2, r5, r4, "WORLD"
  XOR r12, r0, r7
  AND r3, r14, r11
  XOR r13, r6, r7
  AND r14, r4, r15
  XOR r12, r14, r6
  XOR r15, r4, r10
  XOR r8, r13, r7
  SHL r6, r20, r13
  FRAME
  JMP main_0
