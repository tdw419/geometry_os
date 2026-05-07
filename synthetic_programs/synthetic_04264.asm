; drawing loop program
; initialization
  LDI r14, 2543
  LDI r0, 255
  LDI r1, 0x73D4AD
  LDI r6, 893
main_0:
  AND r14, r7, r6
  XOR r12, r5, r25
  AND r14, r6, r0
  XOR r11, r9, r8
  CMPI r12, 0x7D0F7D
  ADDI r13, r12, 2
  LDI r3, 0xA789CF
  LDI r4, 2
  LDI r10, 3730
  DRAWTEXT r3, r4, r10, "WORLD"
  SHR r1, r15, r12
  SHLI r3, r6, 32
  SAR r8, r11, r0
  FRAME
  JMP main_0
