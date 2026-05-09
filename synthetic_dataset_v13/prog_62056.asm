; DESCRIPTION: Composite: Draws a yellow line from (411, 56) to (55, 9) then Renders a green disk with center (272, 173) and radius 46 then Places a purple dot at position (308, 174).
; PLAN: r0=411(x1), r1=56(y1), r2=55(x2), r3=9(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=173(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x), r11=174(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 56
LDI r2, 55
LDI r3, 9
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 173
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 174
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
