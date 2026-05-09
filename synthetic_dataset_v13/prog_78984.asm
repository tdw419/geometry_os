; DESCRIPTION: Draws a red rectangle at (140, 130) with width 115 and height 94.
; PLAN: r0=140(x), r1=130(y), r2=115(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 130
LDI r2, 115
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
