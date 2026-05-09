; DESCRIPTION: Composite: Places a red circle of radius 14 at center (351, 76) then Renders a yellow box of size 70x96 starting at (206, 49).
; PLAN: r0=351(x), r1=76(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=49(y), r7=70(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 76
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 49
LDI r7, 70
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
