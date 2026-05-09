; DESCRIPTION: Renders a yellow box of size 83x54 starting at (141, 69).
; PLAN: r0=141(x), r1=69(y), r2=83(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 69
LDI r2, 83
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
