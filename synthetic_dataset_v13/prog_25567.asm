; DESCRIPTION: Composite: Renders a yellow line between points (133, 104) and (88, 7) then Renders a cyan disk with center (270, 100) and radius 63 then Sets a single orange pixel at (435, 0).
; PLAN: r0=133(x1), r1=104(y1), r2=88(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=100(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=435(x), r11=0(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 104
LDI r2, 88
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 100
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 435
LDI r11, 0
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
