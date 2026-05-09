; DESCRIPTION: Renders a yellow box of size 45x24 starting at (175, 119).
; PLAN: r0=175(x), r1=119(y), r2=45(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 119
LDI r2, 45
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
