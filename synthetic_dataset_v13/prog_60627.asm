; DESCRIPTION: Composite: Places a blue dot at position (371, 207) then Renders a blue line between points (434, 81) and (58, 50) then Renders a blue disk with center (172, 91) and radius 77.
; PLAN: r0=371(x), r1=207(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=434(x1), r6=81(y1), r7=58(x2), r8=50(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=91(y), r12=77(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 371
LDI r1, 207
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 81
LDI r7, 58
LDI r8, 50
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 91
LDI r12, 77
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
