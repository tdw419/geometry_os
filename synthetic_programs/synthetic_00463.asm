; drawing loop program
; initialization
  LDI r1, 2
  LDI r4, 0x65CB2F
  LDI r13, 1
  LDI r8, 385
  LDI r2, 0xEC4A5C
  LDI r0, 1
; palette
  LDI r10, 0x301E
  LDI r9, 1
  LDI r5, 0x00FF00
  STORE r10, r5
  ADD r10, r10, r9
  LDI r5, 0xFFFF00
  STORE r10, r5
  ADD r10, r10, r9
  LDI r5, 0x0000CC
  STORE r10, r5
  ADD r10, r10, r9
  LDI r5, 0x00AAFF
  STORE r10, r5
  ADD r10, r10, r9
  LDI r5, 0xAAAAAA
  STORE r10, r5
  ADD r10, r10, r9
main_0:
  LDI r14, 0
  LDI r7, 128
  LDI r7, 880
  LDI r1, 0x38BE9F
  LDI r8, 990
  LINE r14, r7, r7, r1, r8
  LDI r13, 0xB2DCE3
  LDI r9, 128
  LDI r5, 3416
  DRAWTEXT r13, r9, r5, "WORLD"
  SHL r7, r9, r0
  SHL r6, r13, r12
  SAR r11, r10, r2
  OR r14, r15, r30
  FRAME
  JMP main_0
