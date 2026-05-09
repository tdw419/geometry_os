; DESCRIPTION: Renders a purple box of size 11x52 starting at (333, 8).
; PLAN: r0=333(x), r1=8(y), r2=11(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 8
LDI r2, 11
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
