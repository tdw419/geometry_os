; DESCRIPTION: Composite: Draws a yellow circle centered at (298, 170) with radius 65 then Places a red line segment connecting (204, 21) to (286, 208).
; PLAN: r0=298(x), r1=170(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x1), r6=21(y1), r7=286(x2), r8=208(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 170
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 21
LDI r7, 286
LDI r8, 208
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
