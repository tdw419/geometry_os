; DESCRIPTION: Composite: Draws a black circle centered at (76, 158) with radius 24 then Renders a yellow box of size 73x72 starting at (89, 60).
; PLAN: r0=76(x), r1=158(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=60(y), r7=73(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 158
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 60
LDI r7, 73
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
