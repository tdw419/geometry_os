; DESCRIPTION: Renders a yellow box of size 39x62 starting at (104, 100).
; PLAN: r0=104(x), r1=100(y), r2=39(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 100
LDI r2, 39
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
