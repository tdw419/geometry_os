; DESCRIPTION: Composite: Places a cyan line segment connecting (396, 224) to (53, 113) then Places a red circle of radius 78 at center (253, 174).
; PLAN: r0=396(x1), r1=224(y1), r2=53(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=174(y), r7=78(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 224
LDI r2, 53
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 174
LDI r7, 78
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
