; DESCRIPTION: Composite: Places a red line segment connecting (417, 124) to (266, 246) then Draws a cyan circle centered at (372, 83) with radius 21.
; PLAN: r0=417(x1), r1=124(y1), r2=266(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=83(y), r7=21(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 417
LDI r1, 124
LDI r2, 266
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 83
LDI r7, 21
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
