; DESCRIPTION: Composite: Places a green circle of radius 38 at center (192, 81) then Places a green line segment connecting (381, 142) to (140, 180).
; PLAN: r0=192(x), r1=81(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x1), r6=142(y1), r7=140(x2), r8=180(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 81
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 142
LDI r7, 140
LDI r8, 180
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
