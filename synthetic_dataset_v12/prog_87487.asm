; DESCRIPTION: Renders a purple box of size 10x119 starting at (18, 12).
; PLAN: r0=18(x), r1=12(y), r2=10(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 12
LDI r2, 10
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
