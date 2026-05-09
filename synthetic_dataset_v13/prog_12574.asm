; DESCRIPTION: Composite: Places a green circle of radius 29 at center (326, 186) then Places a white line segment connecting (102, 219) to (369, 13).
; PLAN: r0=326(x), r1=186(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x1), r6=219(y1), r7=369(x2), r8=13(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 186
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 219
LDI r7, 369
LDI r8, 13
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
