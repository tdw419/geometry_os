; DESCRIPTION: Composite: Renders a green line between points (478, 81) and (328, 218) then Places a cyan circle of radius 77 at center (118, 82) then Sets a single magenta pixel at (162, 226).
; PLAN: r0=478(x1), r1=81(y1), r2=328(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=82(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=162(x), r11=226(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 478
LDI r1, 81
LDI r2, 328
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 82
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 162
LDI r11, 226
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
