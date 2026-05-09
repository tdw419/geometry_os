; DESCRIPTION: Composite: Places a cyan line segment connecting (334, 83) to (73, 219) then Sets a single magenta pixel at (77, 233) then Places a cyan circle of radius 50 at center (163, 59).
; PLAN: r0=334(x1), r1=83(y1), r2=73(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=233(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=163(x), r11=59(y), r12=50(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 334
LDI r1, 83
LDI r2, 73
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 233
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 163
LDI r11, 59
LDI r12, 50
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
