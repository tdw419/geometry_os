; DESCRIPTION: Renders a purple box of size 18x11 starting at (223, 162).
; PLAN: r0=223(x), r1=162(y), r2=18(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 162
LDI r2, 18
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
