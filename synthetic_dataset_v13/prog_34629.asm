; DESCRIPTION: Draws a black rectangle at (79, 90) with width 20 and height 87.
; PLAN: r0=79(x), r1=90(y), r2=20(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 90
LDI r2, 20
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
