; drawing loop program
; initialization
  LDI r15, 1
  LDI r11, 3615
  LDI r13, 0x7EBC77
  LDI r1, 1
  LDI r3, 256
main_0:
  SUBI r6, r1, 86
  OR r8, r19, r13
  AND r20, r4, r10
  AND r12, r8, r2
  OR r8, r11, r15
  AND r2, r14, r11
  AND r12, r13, r15
  OR r9, r4, r15
  OR r1, r14, r5
  LDI r13, 0x438A1C
  LDI r9, 0x8C4C47
  LDI r11, 0xBE624E
  DRAWTEXT r13, r9, r11, "WORLD"
  FRAME
  JMP main_0
