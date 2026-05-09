; DESCRIPTION: Composite: Draws a white circle centered at (365, 31) with radius 12 then Places a red dot at position (330, 158) then Renders a orange line between points (18, 11) and (145, 55).
; PLAN: r0=365(x), r1=31(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=158(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=18(x1), r11=11(y1), r12=145(x2), r13=55(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 365
LDI r1, 31
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 158
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 18
LDI r11, 11
LDI r12, 145
LDI r13, 55
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
