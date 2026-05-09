; DESCRIPTION: Composite: Places a green dot at position (437, 129) then Renders a purple line between points (206, 85) and (508, 124) then Renders a yellow disk with center (412, 41) and radius 38.
; PLAN: r0=437(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=206(x1), r6=85(y1), r7=508(x2), r8=124(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=412(x), r11=41(y), r12=38(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 437
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 206
LDI r6, 85
LDI r7, 508
LDI r8, 124
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 41
LDI r12, 38
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
