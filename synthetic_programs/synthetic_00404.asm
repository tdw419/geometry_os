; mixed program
; initialization
  LDI r7, 128
  LDI r8, 10
  LDI r9, 255
  LDI r3, 0x4BAE5F
  MUL r6, r15, r14
  LDI r13, 0x93791C
  LDI r2, 0x32DA7A
  LDI r0, 0xD082F4
  LDI r15, 0
  LDI r13, 255
  RECTF r13, r2, r0, r15, r13
  LDI r12, 128
  STORE r12, r14
  LOAD r11, r12
  LDI r28, 1176
  STORE r28, r0
  LOAD r8, r28
  LDI r15, 0x7B0D87
  STORE r15, r11
  LOAD r1, r15
  LDI r15, 0x9CC224
  STORE r15, r7
  LOAD r11, r15
  LDI r5, 1769
  STORE r5, r13
  LOAD r6, r5
main_0:
  LDI r4, 0
  LDI r13, 0xF72A7D
  LDI r0, 0x1CC5CE
  DRAWTEXT r4, r13, r0, "WORLD"
  OR r2, r5, r15
  AND r3, r0, r8
  AND r11, r1, r7
  OR r13, r1, r15
  ANDI r12, r9, 0xB3FD87
  FRAME
  JMP main_0
