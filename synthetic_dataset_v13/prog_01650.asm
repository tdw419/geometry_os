; DESCRIPTION: Composite: Draws a white line from (198, 59) to (443, 98) then Creates a black circular shape at (40, 169) with radius 26.
; PLAN: r0=198(x1), r1=59(y1), r2=443(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=169(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 59
LDI r2, 443
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 169
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
