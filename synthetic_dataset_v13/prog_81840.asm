; DESCRIPTION: Renders a yellow box of size 105x40 starting at (148, 144).
; PLAN: r0=148(x), r1=144(y), r2=105(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 144
LDI r2, 105
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
