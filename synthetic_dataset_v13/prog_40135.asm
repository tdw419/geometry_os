; DESCRIPTION: Composite: Draws a red line from (388, 110) to (250, 64) then Renders a magenta disk with center (463, 124) and radius 14 then Sets a single red pixel at (117, 113).
; PLAN: r0=388(x1), r1=110(y1), r2=250(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=124(y), r7=14(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=113(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 388
LDI r1, 110
LDI r2, 250
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 124
LDI r7, 14
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 113
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
