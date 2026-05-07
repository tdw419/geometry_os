; input driven program
; initialization
  LDI r9, 0xC6898A
  LDI r10, 0x8BB9BC
  LDI r6, 32
  LDI r11, 0x801C79
main_0:
  AND r15, r12, r9
  AND r13, r9, r0
  CMPI r6, r9, 204
  LDI r14, 0x4D1546
  LDI r11, 64
  LDI r14, 2
  TEXT r14, r11, r14, "HELLO"
  LDI r11, 16
  LDI r4, 0x52D24D
  LDI r3, 10
  DRAWTEXT r11, r4, r3, "WORLD"
  SAR r12, r10, r15
  SAR r5, r15, r13
  FRAME
  JMP main_0
