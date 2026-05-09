; DESCRIPTION: Renders a yellow box of size 75x38 starting at (274, 115).
; PLAN: r0=274(x), r1=115(y), r2=75(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 115
LDI r2, 75
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
