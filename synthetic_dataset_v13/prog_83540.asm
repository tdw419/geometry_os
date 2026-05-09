; DESCRIPTION: Renders a blue box of size 13x109 starting at (36, 138).
; PLAN: r0=36(x), r1=138(y), r2=13(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 138
LDI r2, 13
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
