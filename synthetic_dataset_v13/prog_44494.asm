; DESCRIPTION: Renders a purple box of size 10x16 starting at (13, 205).
; PLAN: r0=13(x), r1=205(y), r2=10(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 205
LDI r2, 10
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
