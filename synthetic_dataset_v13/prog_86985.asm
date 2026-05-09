; DESCRIPTION: Renders a purple box of size 66x80 starting at (169, 156).
; PLAN: r0=169(x), r1=156(y), r2=66(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 156
LDI r2, 66
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
