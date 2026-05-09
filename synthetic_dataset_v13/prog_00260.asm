; DESCRIPTION: Draws a green rectangle at (80, 131) with width 59 and height 103.
; PLAN: r0=80(x), r1=131(y), r2=59(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 131
LDI r2, 59
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
