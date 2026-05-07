; drawing loop program
; initialization
  LDI r4, 0xAC9EF1
  LDI r10, 0xFC4936
  LDI r2, 0xCBF5B5
  LDI r0, 0x791FAD
  LDI r1, 255
  LDI r15, 0xB83CBC
  LDI r5, 0
main_0:
  XOR r2, r12, r3
  LDI r6, 1513
  LDI r5, 8
  LDI r2, 0x1EE33A
  LDI r0, 64
  LDI r12, 1044
  RECTF r6, r5, r2, r0, r12
  XOR r6, r2, r10
  AND r6, r3, r1
  AND r13, r7, r11
  FRAME
  JMP main_0
