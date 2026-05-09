; DESCRIPTION: Renders a purple box of size 75x35 starting at (137, 162).
; PLAN: r0=137(x), r1=162(y), r2=75(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 162
LDI r2, 75
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
