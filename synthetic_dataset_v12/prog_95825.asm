; DESCRIPTION: Renders a purple box of size 44x26 starting at (162, 20).
; PLAN: r0=162(x), r1=20(y), r2=44(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 20
LDI r2, 44
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
