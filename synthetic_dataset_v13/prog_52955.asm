; DESCRIPTION: Composite: Renders a white line between points (380, 102) and (232, 211) then Draws a yellow circle centered at (54, 109) with radius 32.
; PLAN: r0=380(x1), r1=102(y1), r2=232(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=109(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 380
LDI r1, 102
LDI r2, 232
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 109
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
