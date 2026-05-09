; DESCRIPTION: Composite: Renders a yellow line between points (119, 171) and (287, 119) then Renders a orange disk with center (431, 108) and radius 56 then Places a red dot at position (122, 169).
; PLAN: r0=119(x1), r1=171(y1), r2=287(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=108(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=169(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 171
LDI r2, 287
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 108
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 169
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
