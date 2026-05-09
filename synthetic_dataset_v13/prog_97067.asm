; DESCRIPTION: Draws a black rectangle at (140, 10) with width 98 and height 95.
; PLAN: r0=140(x), r1=10(y), r2=98(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 10
LDI r2, 98
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
