; DESCRIPTION: Renders a yellow box of size 66x62 starting at (19, 136).
; PLAN: r0=19(x), r1=136(y), r2=66(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 136
LDI r2, 66
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
