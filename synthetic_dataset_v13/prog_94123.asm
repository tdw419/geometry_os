; DESCRIPTION: Composite: Places a white dot at position (55, 68) then Renders a red disk with center (106, 94) and radius 55 then Draws a yellow line from (489, 247) to (56, 204).
; PLAN: r0=55(x), r1=68(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=94(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=489(x1), r11=247(y1), r12=56(x2), r13=204(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 68
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 106
LDI r6, 94
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 489
LDI r11, 247
LDI r12, 56
LDI r13, 204
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
