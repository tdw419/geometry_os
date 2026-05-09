; DESCRIPTION: Draws a black rectangle at (50, 107) with width 75 and height 79.
; PLAN: r0=50(x), r1=107(y), r2=75(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 107
LDI r2, 75
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
