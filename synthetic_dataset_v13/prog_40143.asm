; DESCRIPTION: Composite: Renders a black line between points (134, 23) and (86, 111) then Sets a single green pixel at (428, 18) then Renders a magenta disk with center (214, 70) and radius 17.
; PLAN: r0=134(x1), r1=23(y1), r2=86(x2), r3=111(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=18(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=214(x), r11=70(y), r12=17(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 134
LDI r1, 23
LDI r2, 86
LDI r3, 111
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 18
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 214
LDI r11, 70
LDI r12, 17
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
