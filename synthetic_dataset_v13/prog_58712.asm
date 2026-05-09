; DESCRIPTION: Composite: Places a yellow dot at position (269, 83) then Draws a yellow line from (278, 74) to (79, 33) then Draws a green circle centered at (302, 159) with radius 72.
; PLAN: r0=269(x), r1=83(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=74(y1), r7=79(x2), r8=33(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=159(y), r12=72(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 83
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 278
LDI r6, 74
LDI r7, 79
LDI r8, 33
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 159
LDI r12, 72
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
