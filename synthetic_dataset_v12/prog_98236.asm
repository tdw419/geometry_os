; DESCRIPTION: Composite: Draws a cyan circle centered at (430, 52) with radius 45 then Renders a green line between points (400, 38) and (294, 104).
; PLAN: r0=430(x), r1=52(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x1), r6=38(y1), r7=294(x2), r8=104(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 52
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 38
LDI r7, 294
LDI r8, 104
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
