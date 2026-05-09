; DESCRIPTION: Composite: Draws a yellow circle centered at (198, 118) with radius 59 then Renders a orange line between points (181, 242) and (368, 233) then Places a orange dot at position (478, 25).
; PLAN: r0=198(x), r1=118(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=242(y1), r7=368(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=478(x), r11=25(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 118
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 242
LDI r7, 368
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 478
LDI r11, 25
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
