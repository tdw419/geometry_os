; DESCRIPTION: Composite: Sets a single red pixel at (489, 46) then Renders a magenta line between points (364, 57) and (411, 151) then Places a blue circle of radius 52 at center (317, 192).
; PLAN: r0=489(x), r1=46(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=364(x1), r6=57(y1), r7=411(x2), r8=151(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=317(x), r11=192(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 489
LDI r1, 46
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 364
LDI r6, 57
LDI r7, 411
LDI r8, 151
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 192
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
