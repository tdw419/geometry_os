; DESCRIPTION: Renders a green box of size 111x118 starting at (274, 48).
; PLAN: r0=274(x), r1=48(y), r2=111(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 48
LDI r2, 111
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
