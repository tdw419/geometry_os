; counted animation
; initialization
  LDI r0, 0x0D1615
  LDI r11, 0x9F1C87
  LDI r6, 8
  LDI r13, 256
  LDI r10, 0x79CE5B
  LDI r4, 2178
  LDI r2, 0x061BA6
  LDI r9, 0x95F02A
  LDI r9, 1
loop_0:
  LDI r5, 0x404250
  LDI r6, 0xED88C0
  LDI r1, 2241
  PSET r5, r6, r1
  LDI r5, 1
  SUB r9, r9, r5
  JNZ r9, loop_0
  HALT
