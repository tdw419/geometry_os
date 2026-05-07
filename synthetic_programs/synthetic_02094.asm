; drawing loop program
; initialization
  LDI r13, 0xF8519A
  LDI r11, 197
main_0:
  LDI r8, 1
  LDI r0, 4
  LDI r7, 255
  TEXT r8, r0, r7, "HELLO"
  LDI r3, 1258
  LDI r1, 16
  LDI r0, 32
  TEXT r3, r1, r0, "HELLO"
  OR r15, r9, r1
  XOR r11, r8, r10
  MOD r12, r6, r14
  LDI r9, 16
  LDI r3, 2
  LDI r1, 3809
  LDI r3, 3480
  LDI r0, 3315
  RECTF r9, r3, r1, r3, r0
  FRAME
  JMP main_0
