; DESCRIPTION: Composite: Places a green circle of radius 53 at center (424, 155) then Places a cyan line segment connecting (406, 66) to (436, 194).
; PLAN: r0=424(x), r1=155(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x1), r6=66(y1), r7=436(x2), r8=194(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 155
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 66
LDI r7, 436
LDI r8, 194
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
