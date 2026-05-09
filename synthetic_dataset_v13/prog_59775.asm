; DESCRIPTION: Renders a purple box of size 88x100 starting at (245, 75).
; PLAN: r0=245(x), r1=75(y), r2=88(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 75
LDI r2, 88
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
