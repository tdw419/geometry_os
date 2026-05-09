; DESCRIPTION: Renders a purple box of size 52x61 starting at (52, 1).
; PLAN: r0=52(x), r1=1(y), r2=52(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 1
LDI r2, 52
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
