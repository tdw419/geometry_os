; DESCRIPTION: Composite: Renders a green line between points (275, 106) and (288, 26) then Places a green circle of radius 54 at center (250, 192) then Sets a single purple pixel at (493, 209).
; PLAN: r0=275(x1), r1=106(y1), r2=288(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=192(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=493(x), r11=209(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 106
LDI r2, 288
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 192
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 493
LDI r11, 209
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
