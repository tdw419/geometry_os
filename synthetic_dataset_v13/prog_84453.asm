; DESCRIPTION: Renders a purple box of size 72x66 starting at (160, 79).
; PLAN: r0=160(x), r1=79(y), r2=72(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 79
LDI r2, 72
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
