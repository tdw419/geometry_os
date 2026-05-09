; DESCRIPTION: Composite: Places a white dot at position (383, 156) then Renders a blue disk with center (370, 199) and radius 43 then Draws a red line from (335, 206) to (489, 25).
; PLAN: r0=383(x), r1=156(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=199(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=335(x1), r11=206(y1), r12=489(x2), r13=25(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 156
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 199
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 335
LDI r11, 206
LDI r12, 489
LDI r13, 25
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
