; DESCRIPTION: Composite: Places a cyan dot at position (399, 23) then Renders a orange line between points (388, 199) and (377, 233) then Renders a white disk with center (44, 59) and radius 44.
; PLAN: r0=399(x), r1=23(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=388(x1), r6=199(y1), r7=377(x2), r8=233(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=44(x), r11=59(y), r12=44(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 399
LDI r1, 23
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 199
LDI r7, 377
LDI r8, 233
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 59
LDI r12, 44
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
