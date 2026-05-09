; DESCRIPTION: Composite: Creates a cyan circular shape at (355, 211) with radius 25 then Places a white line segment connecting (212, 130) to (369, 210).
; PLAN: r0=355(x), r1=211(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x1), r6=130(y1), r7=369(x2), r8=210(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 211
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 130
LDI r7, 369
LDI r8, 210
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
