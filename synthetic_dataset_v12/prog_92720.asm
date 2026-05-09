; DESCRIPTION: Renders a purple box of size 63x80 starting at (10, 28).
; PLAN: r0=10(x), r1=28(y), r2=63(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 28
LDI r2, 63
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
