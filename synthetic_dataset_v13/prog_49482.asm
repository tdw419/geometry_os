; DESCRIPTION: Renders a purple box of size 91x99 starting at (234, 63).
; PLAN: r0=234(x), r1=63(y), r2=91(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 63
LDI r2, 91
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
