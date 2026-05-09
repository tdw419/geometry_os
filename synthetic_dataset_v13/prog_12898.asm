; DESCRIPTION: Composite: Draws a white line from (298, 17) to (40, 38) then Sets a single red pixel at (31, 7) then Draws a magenta circle centered at (150, 63) with radius 56.
; PLAN: r0=298(x1), r1=17(y1), r2=40(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=150(x), r11=63(y), r12=56(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 17
LDI r2, 40
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 150
LDI r11, 63
LDI r12, 56
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
