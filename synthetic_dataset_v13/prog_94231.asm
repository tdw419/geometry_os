; DESCRIPTION: Renders a purple box of size 72x94 starting at (193, 63).
; PLAN: r0=193(x), r1=63(y), r2=72(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 63
LDI r2, 72
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
