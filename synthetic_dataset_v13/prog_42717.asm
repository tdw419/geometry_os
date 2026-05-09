; DESCRIPTION: Renders a yellow box of size 29x38 starting at (155, 84).
; PLAN: r0=155(x), r1=84(y), r2=29(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 84
LDI r2, 29
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
