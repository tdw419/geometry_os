; DESCRIPTION: Composite: Creates a red circular shape at (371, 63) with radius 57 then Renders a white line between points (503, 76) and (118, 49) then Sets a single yellow pixel at (498, 217).
; PLAN: r0=371(x), r1=63(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=503(x1), r6=76(y1), r7=118(x2), r8=49(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=498(x), r11=217(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 371
LDI r1, 63
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 503
LDI r6, 76
LDI r7, 118
LDI r8, 49
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 217
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
