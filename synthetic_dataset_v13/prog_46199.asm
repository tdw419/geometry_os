; DESCRIPTION: Composite: Places a cyan circle of radius 71 at center (84, 174) then Places a blue line segment connecting (359, 8) to (328, 254) then Places a purple dot at position (89, 241).
; PLAN: r0=84(x), r1=174(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x1), r6=8(y1), r7=328(x2), r8=254(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=241(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 174
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 8
LDI r7, 328
LDI r8, 254
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 241
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
