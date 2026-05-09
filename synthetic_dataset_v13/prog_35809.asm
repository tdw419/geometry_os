; DESCRIPTION: Composite: Draws a yellow line from (151, 190) to (510, 239) then Creates a purple circular shape at (133, 95) with radius 80 then Sets a single blue pixel at (447, 125).
; PLAN: r0=151(x1), r1=190(y1), r2=510(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=95(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=447(x), r11=125(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 190
LDI r2, 510
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 95
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 447
LDI r11, 125
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
