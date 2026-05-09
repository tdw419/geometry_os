; DESCRIPTION: Composite: Places a yellow dot at position (307, 12) then Draws a white line from (484, 140) to (197, 169) then Renders a white disk with center (357, 92) and radius 43.
; PLAN: r0=307(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=484(x1), r6=140(y1), r7=197(x2), r8=169(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=92(y), r12=43(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 484
LDI r6, 140
LDI r7, 197
LDI r8, 169
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 92
LDI r12, 43
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
