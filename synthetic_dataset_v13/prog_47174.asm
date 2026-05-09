; DESCRIPTION: Draws a black rectangle at (247, 137) with width 85 and height 57.
; PLAN: r0=247(x), r1=137(y), r2=85(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 137
LDI r2, 85
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
