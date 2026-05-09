; DESCRIPTION: Draws a red rectangle at (444, 37) with width 24 and height 90.
; PLAN: r0=444(x), r1=37(y), r2=24(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 37
LDI r2, 24
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
