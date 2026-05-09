; DESCRIPTION: Renders a yellow box of size 111x73 starting at (274, 55).
; PLAN: r0=274(x), r1=55(y), r2=111(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 55
LDI r2, 111
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
