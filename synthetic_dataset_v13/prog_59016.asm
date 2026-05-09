; DESCRIPTION: Draws a cyan rectangle at (300, 15) with width 106 and height 75.
; PLAN: r0=300(x), r1=15(y), r2=106(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 15
LDI r2, 106
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
