; DESCRIPTION: Composite: Renders a black line between points (268, 181) and (325, 133) then Places a yellow dot at position (422, 29).
; PLAN: r0=268(x1), r1=181(y1), r2=325(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=29(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 181
LDI r2, 325
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 29
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
