; DESCRIPTION: Composite: Draws a white line from (125, 160) to (341, 21) then Creates a black circular shape at (320, 139) with radius 12.
; PLAN: r0=125(x1), r1=160(y1), r2=341(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=139(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 160
LDI r2, 341
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 139
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
