; DESCRIPTION: Renders a purple box of size 65x73 starting at (151, 52).
; PLAN: r0=151(x), r1=52(y), r2=65(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 52
LDI r2, 65
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
