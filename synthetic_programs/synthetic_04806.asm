; drawing loop program
; initialization
  LDI r8, 255
  LDI r11, 1619
  LDI r14, 0x09896C
  LDI r3, 10
  LDI r1, 75
main_0:
  AND r7, r1, r6
  AND r7, r8, r14
  OR r10, r14, r1
  LDI r12, 0x36D201
  FILL r12
  LDI r14, 2905
  LDI r15, 0x65B5F3
  LDI r5, 3966
  DRAWTEXT r14, r15, r5, "WORLD"
  LDI r14, 0x43CC8B
  LDI r2, 8
  LDI r10, 2227
  DRAWTEXT r14, r2, r10, "WORLD"
  OR r11, r3, r8
  OR r10, r9, r3
  FRAME
  JMP main_0
