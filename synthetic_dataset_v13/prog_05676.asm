; DESCRIPTION: Composite: Renders a cyan line between points (327, 90) and (347, 204) then Renders a yellow disk with center (425, 83) and radius 18 then Sets a single purple pixel at (31, 39).
; PLAN: r0=327(x1), r1=90(y1), r2=347(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=83(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=31(x), r11=39(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 90
LDI r2, 347
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 83
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 31
LDI r11, 39
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
