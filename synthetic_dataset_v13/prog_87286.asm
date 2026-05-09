; DESCRIPTION: Draws a green rectangle at (338, 87) with width 111 and height 102.
; PLAN: r0=338(x), r1=87(y), r2=111(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 87
LDI r2, 111
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
