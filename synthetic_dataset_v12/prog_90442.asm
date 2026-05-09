; DESCRIPTION: Renders a purple box of size 109x91 starting at (61, 147).
; PLAN: r0=61(x), r1=147(y), r2=109(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 147
LDI r2, 109
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
