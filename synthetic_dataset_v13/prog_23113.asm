; DESCRIPTION: Composite: Creates a yellow circular shape at (426, 148) with radius 80 then Renders a blue line between points (80, 176) and (93, 14) then Sets a single magenta pixel at (262, 233).
; PLAN: r0=426(x), r1=148(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x1), r6=176(y1), r7=93(x2), r8=14(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=233(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 148
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 176
LDI r7, 93
LDI r8, 14
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 233
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
