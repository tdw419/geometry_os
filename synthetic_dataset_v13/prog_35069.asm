; DESCRIPTION: Composite: Renders a red disk with center (216, 48) and radius 36 then Places a orange line segment connecting (393, 57) to (192, 4) then Places a yellow dot at position (459, 77).
; PLAN: r0=216(x), r1=48(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x1), r6=57(y1), r7=192(x2), r8=4(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=459(x), r11=77(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 48
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 57
LDI r7, 192
LDI r8, 4
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 77
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
