; DESCRIPTION: Composite: Renders a green line between points (34, 104) and (473, 77) then Places a magenta dot at position (249, 104) then Draws a red circle centered at (381, 115) with radius 38.
; PLAN: r0=34(x1), r1=104(y1), r2=473(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=104(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=381(x), r11=115(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 34
LDI r1, 104
LDI r2, 473
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 104
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 381
LDI r11, 115
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
