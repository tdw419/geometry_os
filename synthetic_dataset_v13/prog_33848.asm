; DESCRIPTION: Composite: Places a green circle of radius 10 at center (156, 136) then Places a white line segment connecting (141, 177) to (135, 244).
; PLAN: r0=156(x), r1=136(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=177(y1), r7=135(x2), r8=244(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 136
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 177
LDI r7, 135
LDI r8, 244
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
