; DESCRIPTION: Renders a purple box of size 63x39 starting at (402, 162).
; PLAN: r0=402(x), r1=162(y), r2=63(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 162
LDI r2, 63
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
