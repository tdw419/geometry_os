; DESCRIPTION: Composite: Creates a yellow circular shape at (95, 226) with radius 30 then Sets a single orange pixel at (37, 195) then Renders a yellow line between points (477, 34) and (7, 92).
; PLAN: r0=95(x), r1=226(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=195(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=477(x1), r11=34(y1), r12=7(x2), r13=92(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 226
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 195
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 477
LDI r11, 34
LDI r12, 7
LDI r13, 92
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
