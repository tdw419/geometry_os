; DESCRIPTION: Draws a red rectangle at (331, 166) with width 63 and height 80.
; PLAN: r0=331(x), r1=166(y), r2=63(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 166
LDI r2, 63
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
