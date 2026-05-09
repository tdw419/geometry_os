; DESCRIPTION: Composite: Places a green dot at position (510, 138) then Renders a yellow line between points (284, 36) and (451, 150) then Creates a black circular shape at (186, 48) with radius 36.
; PLAN: r0=510(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=284(x1), r6=36(y1), r7=451(x2), r8=150(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=186(x), r11=48(y), r12=36(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 284
LDI r6, 36
LDI r7, 451
LDI r8, 150
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 48
LDI r12, 36
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
