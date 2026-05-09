; DESCRIPTION: Renders a purple box of size 36x23 starting at (52, 96).
; PLAN: r0=52(x), r1=96(y), r2=36(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 96
LDI r2, 36
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
