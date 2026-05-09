; DESCRIPTION: Renders a blue box of size 15x105 starting at (139, 138).
; PLAN: r0=139(x), r1=138(y), r2=15(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 138
LDI r2, 15
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
