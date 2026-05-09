; DESCRIPTION: Composite: Renders a purple disk with center (321, 38) and radius 35 then Draws a purple line from (233, 30) to (222, 48) then Sets a single purple pixel at (2, 115).
; PLAN: r0=321(x), r1=38(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x1), r6=30(y1), r7=222(x2), r8=48(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=115(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 38
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 30
LDI r7, 222
LDI r8, 48
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 115
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
