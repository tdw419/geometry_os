; DESCRIPTION: Draws a red rectangle at (414, 8) with width 29 and height 98.
; PLAN: r0=414(x), r1=8(y), r2=29(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 8
LDI r2, 29
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
