; DESCRIPTION: Draws a yellow rectangle at (145, 95) with width 80 and height 120.
; PLAN: r0=145(x), r1=95(y), r2=80(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 95
LDI r2, 80
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
