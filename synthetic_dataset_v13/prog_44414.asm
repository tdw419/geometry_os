; DESCRIPTION: Composite: Draws a red line from (5, 32) to (124, 204) then Creates a green circular shape at (148, 145) with radius 77 then Places a black dot at position (374, 204).
; PLAN: r0=5(x1), r1=32(y1), r2=124(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=145(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=204(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 5
LDI r1, 32
LDI r2, 124
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 145
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 204
LDI r12, 0x000000
PSET r10, r11, r12
HALT
