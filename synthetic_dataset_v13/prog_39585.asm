; DESCRIPTION: Composite: Places a purple circle of radius 80 at center (254, 147) then Places a white line segment connecting (479, 135) to (471, 79).
; PLAN: r0=254(x), r1=147(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=135(y1), r7=471(x2), r8=79(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 147
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 135
LDI r7, 471
LDI r8, 79
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
