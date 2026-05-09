; DESCRIPTION: Draws a red rectangle at (107, 11) with width 48 and height 106.
; PLAN: r0=107(x), r1=11(y), r2=48(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 11
LDI r2, 48
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
