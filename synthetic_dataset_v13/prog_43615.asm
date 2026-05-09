; DESCRIPTION: Draws a red rectangle at (176, 140) with width 119 and height 109.
; PLAN: r0=176(x), r1=140(y), r2=119(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 140
LDI r2, 119
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
