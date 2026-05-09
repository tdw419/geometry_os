; DESCRIPTION: Composite: Draws a red line from (353, 62) to (3, 248) then Renders a white disk with center (244, 39) and radius 18.
; PLAN: r0=353(x1), r1=62(y1), r2=3(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=39(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 353
LDI r1, 62
LDI r2, 3
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 39
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
