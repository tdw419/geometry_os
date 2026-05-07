; mixed program
; initialization
  LDI r27, 256
  LDI r5, 2429
  CMP r14, r10
  LDI r7, 3730
  LDI r4, 2
  LDI r3, 0x3D6BE0
  TEXT r7, r4, r3, "HELLO"
  CALL func_0
func_0:
  MUL r12, r9, r13
  DIV r1, r6, r0
  OR r5, r1, r9
  RET
  XOR r3, r0, r7
  OR r7, r22, r0
  OR r5, r11, r10
  SHLI r6, r11, 3
  SHL r0, r10, r12
  SAR r17, r2, r9
  LDI r7, 247
  LDI r6, 0x78C6CB
  LDI r11, 0x945452
  TEXT r7, r6, r11, "HELLO"
main_1:
  LDI r14, 0x9800B8
  LDI r1, 0xFE1894
  LDI r0, 0xE8A24E
  TEXT r14, r1, r0, "HELLO"
  ANDI r15, r11, 8
  FRAME
  JMP main_1
