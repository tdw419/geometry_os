; DESCRIPTION: Composite: Renders a orange line between points (416, 160) and (218, 142) then Places a black dot at position (487, 88).
; PLAN: r0=416(x1), r1=160(y1), r2=218(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=88(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 160
LDI r2, 218
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 88
LDI r7, 0x000000
PSET r5, r6, r7
HALT
