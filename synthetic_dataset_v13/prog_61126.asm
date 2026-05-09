; DESCRIPTION: Renders a yellow box of size 55x106 starting at (241, 8).
; PLAN: r0=241(x), r1=8(y), r2=55(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 8
LDI r2, 55
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
