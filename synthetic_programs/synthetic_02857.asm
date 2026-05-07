; input driven program
; initialization
  LDI r6, 2
  LDI r4, 10
  LDI r0, 0x7EEF91
  LDI r3, 1239
  LDI r14, 1
main_0:
  LDI r7, 0xDE7E24
  LDI r14, 4
  LDI r15, 255
  LDI r14, 3914
  LDI r9, 64
  RECTF r7, r14, r15, r14, r9
  CMP r6, r0
  LDI r2, 0xAC4240
  LDI r0, 4
  LDI r10, 0x6CCD2D
  TEXT r2, r0, r10, "HELLO"
  OR r5, r3, r14
  OR r1, r2, r0
  XOR r2, r0, r6
  XOR r0, r8, r15
  LDI r0, 0x8EB563
  LDI r5, 2
  LDI r25, 1725
  DRAWTEXT r0, r5, r25, "WORLD"
  FRAME
  JMP main_0
