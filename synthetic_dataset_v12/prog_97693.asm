; DESCRIPTION: Renders a blue box of size 13x66 starting at (36, 184).
; PLAN: r0=36(x), r1=184(y), r2=13(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 184
LDI r2, 13
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
