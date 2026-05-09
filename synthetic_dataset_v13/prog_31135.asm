; DESCRIPTION: Renders a yellow box of size 43x55 starting at (195, 78).
; PLAN: r0=195(x), r1=78(y), r2=43(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 78
LDI r2, 43
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
