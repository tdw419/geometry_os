; mixed program
; initialization
  LDI r2, 0x7DB0E0
  LDI r15, 0x5EC659
  LDI r7, 1137
  LDI r1, 1826
  LDI r0, 3623
  LDI r4, 0xB40EF6
  LDI r3, 0
  LDI r10, 64
  STORE r10, r12
  LOAD r8, r10
  LDI r14, 128
  STORE r14, r12
  LOAD r7, r14
  LDI r3, 255
  STORE r3, r28
  LOAD r5, r3
  LDI r7, 0x2FEC91
loop_0:
  SUBI r3, r6, 1
  ANDI r4, r2, 0x8110E5
  ANDI r12, r1, 120
  LDI r14, 0x1262D3
  LDI r15, 255
  LDI r1, 4
  LDI r2, 8
  CIRCLE r14, r15, r1, r2
  LDI r2, 1
  SUB r7, r7, r2
  JNZ r7, loop_0
  LDI r11, 64
  LDI r14, 0xB9B73A
  LDI r12, 0
  LDI r3, 300
  LDI r9, 0x0AB5E0
  RECTF r11, r14, r12, r3, r9
  CMP r3, r10
  HALT
