; DESCRIPTION: Draws a red rectangle at (109, 136) with width 48 and height 23.
; PLAN: r0=109(x), r1=136(y), r2=48(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 136
LDI r2, 48
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
