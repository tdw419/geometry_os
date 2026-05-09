; DESCRIPTION: Renders a purple box of size 38x107 starting at (270, 138).
; PLAN: r0=270(x), r1=138(y), r2=38(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 138
LDI r2, 38
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
