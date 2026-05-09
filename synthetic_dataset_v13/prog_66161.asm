; DESCRIPTION: Composite: Places a yellow circle of radius 29 at center (171, 38) then Places a yellow line segment connecting (284, 201) to (221, 33).
; PLAN: r0=171(x), r1=38(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x1), r6=201(y1), r7=221(x2), r8=33(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 38
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 201
LDI r7, 221
LDI r8, 33
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
