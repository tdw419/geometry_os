; DESCRIPTION: Composite: Draws a red circle centered at (359, 99) with radius 71 then Renders a magenta line between points (144, 202) and (507, 133) then Sets a single black pixel at (39, 81).
; PLAN: r0=359(x), r1=99(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x1), r6=202(y1), r7=507(x2), r8=133(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=81(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 359
LDI r1, 99
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 202
LDI r7, 507
LDI r8, 133
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 81
LDI r12, 0x000000
PSET r10, r11, r12
HALT
