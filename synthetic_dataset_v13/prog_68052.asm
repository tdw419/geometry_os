; DESCRIPTION: Composite: Places a yellow circle of radius 56 at center (266, 119) then Renders a blue line between points (48, 5) and (402, 57) then Sets a single purple pixel at (493, 94).
; PLAN: r0=266(x), r1=119(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x1), r6=5(y1), r7=402(x2), r8=57(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=493(x), r11=94(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 119
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 5
LDI r7, 402
LDI r8, 57
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 94
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
