; DESCRIPTION: Composite: Places a white line segment connecting (400, 175) to (374, 192) then Places a yellow circle of radius 48 at center (434, 149).
; PLAN: r0=400(x1), r1=175(y1), r2=374(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=149(y), r7=48(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 175
LDI r2, 374
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 149
LDI r7, 48
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
