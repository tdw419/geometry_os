; drawing loop program
; initialization
  LDI r13, 2146
  LDI r11, 1239
  LDI r3, 128
main_0:
  ADD r5, r13, r4
  CMP r17, r15
  CMP r11, r4
  OR r11, r4, r1
  AND r3, r8, r1
  LDI r7, 0x4EE848
  LDI r10, 256
  LDI r12, 0x82212E
  DRAWTEXT r7, r10, r12, "WORLD"
  FRAME
  JMP main_0
