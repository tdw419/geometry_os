; DESCRIPTION: Renders a yellow box of size 76x106 starting at (124, 60).
; PLAN: r0=124(x), r1=60(y), r2=76(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 60
LDI r2, 76
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
