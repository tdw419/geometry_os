; DESCRIPTION: Composite: Creates a yellow circular shape at (370, 153) with radius 80 then Draws a white line from (165, 9) to (45, 109).
; PLAN: r0=370(x), r1=153(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x1), r6=9(y1), r7=45(x2), r8=109(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 153
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 9
LDI r7, 45
LDI r8, 109
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
