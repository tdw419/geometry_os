; DESCRIPTION: Renders a purple box of size 36x66 starting at (185, 30).
; PLAN: r0=185(x), r1=30(y), r2=36(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 30
LDI r2, 36
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
