; DESCRIPTION: Renders a yellow box of size 105x40 starting at (155, 143).
; PLAN: r0=155(x), r1=143(y), r2=105(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 143
LDI r2, 105
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
