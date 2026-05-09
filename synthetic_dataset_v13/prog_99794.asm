; DESCRIPTION: Draws a yellow rectangle at (193, 12) with width 106 and height 45.
; PLAN: r0=193(x), r1=12(y), r2=106(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 12
LDI r2, 106
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
