; DESCRIPTION: Draws a black rectangle at (75, 95) with width 120 and height 81.
; PLAN: r0=75(x), r1=95(y), r2=120(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 95
LDI r2, 120
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
