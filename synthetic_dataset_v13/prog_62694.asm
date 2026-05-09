; DESCRIPTION: Composite: Places a white line segment connecting (425, 124) to (66, 186) then Creates a green circular shape at (100, 170) with radius 50.
; PLAN: r0=425(x1), r1=124(y1), r2=66(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=100(x), r6=170(y), r7=50(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 124
LDI r2, 66
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 170
LDI r7, 50
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
