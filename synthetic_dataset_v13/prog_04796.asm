; DESCRIPTION: Composite: Draws a green circle centered at (141, 141) with radius 59 then Places a green line segment connecting (478, 129) to (490, 46).
; PLAN: r0=141(x), r1=141(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=478(x1), r6=129(y1), r7=490(x2), r8=46(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 141
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 478
LDI r6, 129
LDI r7, 490
LDI r8, 46
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
