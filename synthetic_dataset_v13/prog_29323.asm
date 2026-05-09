; DESCRIPTION: Composite: Creates a orange circular shape at (305, 112) with radius 40 then Renders a purple line between points (0, 92) and (309, 89) then Places a orange dot at position (78, 36).
; PLAN: r0=305(x), r1=112(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x1), r6=92(y1), r7=309(x2), r8=89(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=78(x), r11=36(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 305
LDI r1, 112
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 92
LDI r7, 309
LDI r8, 89
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 36
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
