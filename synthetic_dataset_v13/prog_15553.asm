; DESCRIPTION: Composite: Places a black circle of radius 71 at center (185, 91) then Renders a blue line between points (142, 67) and (112, 114) then Sets a single cyan pixel at (34, 66).
; PLAN: r0=185(x), r1=91(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x1), r6=67(y1), r7=112(x2), r8=114(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=66(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 185
LDI r1, 91
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 67
LDI r7, 112
LDI r8, 114
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 66
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
