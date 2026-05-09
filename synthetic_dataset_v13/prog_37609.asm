; DESCRIPTION: Renders a purple box of size 63x78 starting at (264, 47).
; PLAN: r0=264(x), r1=47(y), r2=63(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 47
LDI r2, 63
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
