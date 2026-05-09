; DESCRIPTION: Draws a red rectangle at (260, 140) with width 106 and height 12.
; PLAN: r0=260(x), r1=140(y), r2=106(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 140
LDI r2, 106
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
