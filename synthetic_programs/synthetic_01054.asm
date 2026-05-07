; drawing loop program
; initialization
  LDI r11, 0x10AFA6
  LDI r12, 64
  LDI r4, 1503
  LDI r3, 128
  LDI r8, 2791
  LDI r14, 3779
main_0:
  CMPI r9, 250
  SUB r21, r10, r6
  AND r27, r11, r4
  AND r14, r12, r3
  XOR r2, r5, r7
  OR r12, r10, r2
  CMPI r15, 240
  SHLI r3, r11, 6
  SHLI r1, r15, 4
  FRAME
  JMP main_0
