; mixed program
; initialization
  LDI r26, 1682
  LDI r3, 346
  AND r7, r3, r2
  AND r15, r2, r10
  XOR r5, r1, r13
  XOR r11, r12, r6
  LDI r14, 16
  LDI r0, 255
  LDI r8, 64
  DRAWTEXT r14, r0, r8, "WORLD"
  CMPI r11, 4
  LDI r6, 128
  LDI r2, 255
  LDI r18, 0x36D0DE
  DRAWTEXT r6, r2, r18, "WORLD"
  PUSH r10
  PUSH r1
  SUB r9, r11, r12
  SUB r12, r10, r4
  POP r1
  POP r10
  LDI r8, 128
  LDI r0, 255
  LDI r8, 0x5629B2
  TEXT r8, r0, r8, "HELLO"
  SUB r12, r8, r6
  HALT
