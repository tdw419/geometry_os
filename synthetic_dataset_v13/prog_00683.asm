; DESCRIPTION: Renders a blue box of size 109x19 starting at (19, 138).
; PLAN: r0=19(x), r1=138(y), r2=109(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 138
LDI r2, 109
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
