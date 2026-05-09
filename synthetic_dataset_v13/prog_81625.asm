; DESCRIPTION: Renders a blue box of size 101x112 starting at (275, 83).
; PLAN: r0=275(x), r1=83(y), r2=101(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 83
LDI r2, 101
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
