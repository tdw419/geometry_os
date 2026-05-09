; DESCRIPTION: Renders a yellow box of size 92x65 starting at (274, 189).
; PLAN: r0=274(x), r1=189(y), r2=92(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 189
LDI r2, 92
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
