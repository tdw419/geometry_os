; DESCRIPTION: Renders a blue box of size 30x48 starting at (478, 165).
; PLAN: r0=478(x), r1=165(y), r2=30(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 165
LDI r2, 30
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
