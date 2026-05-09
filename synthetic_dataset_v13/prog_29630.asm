; DESCRIPTION: Composite: Draws a white circle centered at (148, 199) with radius 51 then Places a yellow dot at position (292, 28) then Draws a white line from (278, 85) to (207, 111).
; PLAN: r0=148(x), r1=199(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=28(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=278(x1), r11=85(y1), r12=207(x2), r13=111(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 199
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 28
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 278
LDI r11, 85
LDI r12, 207
LDI r13, 111
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
