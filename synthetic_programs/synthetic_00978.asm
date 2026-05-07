; drawing loop program
; initialization
  LDI r2, 0xF91107
  LDI r5, 1207
  LDI r0, 0
  LDI r15, 4
  LDI r18, 10
  LDI r6, 760
main_0:
  OR r6, r8, r14
  OR r11, r0, r5
  CMP r3, r9
  ADD r8, r10, r1
  LDI r23, 0x2E51AE
  LDI r5, 32
  LDI r8, 0
  DRAWTEXT r23, r5, r8, "WORLD"
  SHR r6, r0, r10
  SHR r10, r11, r13
  FRAME
  JMP main_0
