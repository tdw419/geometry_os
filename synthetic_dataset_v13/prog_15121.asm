; DESCRIPTION: Composite: Places a red circle of radius 53 at center (58, 75) then Draws a yellow line from (486, 146) to (134, 124) then Sets a single orange pixel at (504, 52).
; PLAN: r0=58(x), r1=75(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x1), r6=146(y1), r7=134(x2), r8=124(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=504(x), r11=52(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 75
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 146
LDI r7, 134
LDI r8, 124
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 504
LDI r11, 52
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
