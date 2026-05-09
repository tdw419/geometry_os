; DESCRIPTION: Renders a purple box of size 10x62 starting at (131, 13).
; PLAN: r0=131(x), r1=13(y), r2=10(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 13
LDI r2, 10
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
