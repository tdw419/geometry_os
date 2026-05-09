; DESCRIPTION: Composite: Renders a red line between points (51, 57) and (89, 15) then Places a blue circle of radius 70 at center (281, 166) then Sets a single red pixel at (178, 64).
; PLAN: r0=51(x1), r1=57(y1), r2=89(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=166(y), r7=70(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x), r11=64(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 57
LDI r2, 89
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 166
LDI r7, 70
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 64
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
