; Synthetic GeOS Program
; initialization
LDI r9, 11
LDI r0, 297
LDI r10, 419
LDI r27, 370
LDI r6, 0xFF00FF
LDI r7, 275
; main loop
loop_0:
  LDI r19, 16776960
  FILL r19
RECTF r31, r15, r23, r16, r20
CIRCLE r26, r11, r27, r13
PSET r20, r19, r13
  CMP r2, r8
  JZ r0, loop_0
  FRAME
  JMP loop_0