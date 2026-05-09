; DESCRIPTION: Composite: Places a yellow dot at position (476, 16) then Renders a black line between points (489, 22) and (350, 148).
; PLAN: r0=476(x), r1=16(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=489(x1), r6=22(y1), r7=350(x2), r8=148(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 16
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 489
LDI r6, 22
LDI r7, 350
LDI r8, 148
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
