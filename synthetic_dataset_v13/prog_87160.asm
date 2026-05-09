; DESCRIPTION: Composite: Places a purple dot at position (290, 54) then Places a green line segment connecting (210, 235) to (342, 184) then Renders a blue disk with center (140, 223) and radius 22.
; PLAN: r0=290(x), r1=54(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=210(x1), r6=235(y1), r7=342(x2), r8=184(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=140(x), r11=223(y), r12=22(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 54
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 235
LDI r7, 342
LDI r8, 184
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 140
LDI r11, 223
LDI r12, 22
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
