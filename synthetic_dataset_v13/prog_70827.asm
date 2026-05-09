; DESCRIPTION: Draws a yellow rectangle at (75, 38) with width 120 and height 106.
; PLAN: r0=75(x), r1=38(y), r2=120(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 38
LDI r2, 120
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
