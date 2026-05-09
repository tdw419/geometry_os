; DESCRIPTION: Composite: Places a yellow dot at position (353, 105) then Renders a magenta line between points (303, 86) and (460, 187) then Places a red circle of radius 76 at center (145, 95).
; PLAN: r0=353(x), r1=105(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=303(x1), r6=86(y1), r7=460(x2), r8=187(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=95(y), r12=76(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 353
LDI r1, 105
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 303
LDI r6, 86
LDI r7, 460
LDI r8, 187
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 95
LDI r12, 76
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
