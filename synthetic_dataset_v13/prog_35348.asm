; DESCRIPTION: Renders a yellow box of size 49x82 starting at (399, 55).
; PLAN: r0=399(x), r1=55(y), r2=49(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 55
LDI r2, 49
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
