; DESCRIPTION: Renders a purple box of size 63x35 starting at (234, 91).
; PLAN: r0=234(x), r1=91(y), r2=63(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 91
LDI r2, 63
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
