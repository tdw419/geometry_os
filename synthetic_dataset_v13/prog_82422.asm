; DESCRIPTION: Composite: Places a purple circle of radius 53 at center (278, 129) then Places a green line segment connecting (141, 192) to (196, 188).
; PLAN: r0=278(x), r1=129(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=192(y1), r7=196(x2), r8=188(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 129
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 192
LDI r7, 196
LDI r8, 188
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
