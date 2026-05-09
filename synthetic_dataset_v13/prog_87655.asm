; DESCRIPTION: Composite: Places a blue circle of radius 18 at center (431, 84) then Places a cyan line segment connecting (222, 232) to (436, 41).
; PLAN: r0=431(x), r1=84(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x1), r6=232(y1), r7=436(x2), r8=41(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 84
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 232
LDI r7, 436
LDI r8, 41
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
