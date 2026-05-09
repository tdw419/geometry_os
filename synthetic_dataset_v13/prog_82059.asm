; DESCRIPTION: Renders a purple box of size 110x61 starting at (124, 10).
; PLAN: r0=124(x), r1=10(y), r2=110(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 10
LDI r2, 110
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
