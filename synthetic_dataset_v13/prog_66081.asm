; DESCRIPTION: Composite: Creates a blue circular shape at (131, 62) with radius 51 then Renders a red line between points (500, 17) and (240, 118) then Places a yellow dot at position (345, 78).
; PLAN: r0=131(x), r1=62(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=500(x1), r6=17(y1), r7=240(x2), r8=118(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=78(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 131
LDI r1, 62
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 500
LDI r6, 17
LDI r7, 240
LDI r8, 118
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 78
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
