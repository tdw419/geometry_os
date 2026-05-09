; DESCRIPTION: Composite: Places a cyan line segment connecting (35, 243) to (167, 86) then Places a purple circle of radius 66 at center (347, 84).
; PLAN: r0=35(x1), r1=243(y1), r2=167(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=84(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 35
LDI r1, 243
LDI r2, 167
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 84
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
