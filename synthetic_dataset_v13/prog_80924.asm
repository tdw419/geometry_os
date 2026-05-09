; DESCRIPTION: Renders a yellow box of size 45x49 starting at (318, 138).
; PLAN: r0=318(x), r1=138(y), r2=45(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 138
LDI r2, 45
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
