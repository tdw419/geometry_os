; DESCRIPTION: Composite: Places a cyan circle of radius 29 at center (372, 146) then Places a purple line segment connecting (318, 84) to (287, 235).
; PLAN: r0=372(x), r1=146(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x1), r6=84(y1), r7=287(x2), r8=235(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 146
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 84
LDI r7, 287
LDI r8, 235
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
