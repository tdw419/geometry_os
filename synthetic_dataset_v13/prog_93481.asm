; DESCRIPTION: Composite: Renders a yellow disk with center (194, 127) and radius 34 then Sets a single cyan pixel at (120, 166) then Renders a black line between points (179, 18) and (490, 190).
; PLAN: r0=194(x), r1=127(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=166(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=179(x1), r11=18(y1), r12=490(x2), r13=190(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 127
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 166
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 179
LDI r11, 18
LDI r12, 490
LDI r13, 190
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
