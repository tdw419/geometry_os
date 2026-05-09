; DESCRIPTION: Composite: Places a green circle of radius 40 at center (360, 83) then Places a yellow line segment connecting (360, 126) to (345, 220).
; PLAN: r0=360(x), r1=83(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x1), r6=126(y1), r7=345(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 83
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 126
LDI r7, 345
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
