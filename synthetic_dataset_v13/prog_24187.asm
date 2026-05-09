; DESCRIPTION: Composite: Places a blue line segment connecting (422, 18) to (29, 182) then Places a green circle of radius 16 at center (205, 39).
; PLAN: r0=422(x1), r1=18(y1), r2=29(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=39(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 18
LDI r2, 29
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 39
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
