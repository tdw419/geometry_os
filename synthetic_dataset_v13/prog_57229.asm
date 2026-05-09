; DESCRIPTION: Renders a purple box of size 46x14 starting at (3, 162).
; PLAN: r0=3(x), r1=162(y), r2=46(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 162
LDI r2, 46
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
