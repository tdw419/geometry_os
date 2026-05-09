; DESCRIPTION: Composite: Places a blue 114x101 rectangle at position (36, 53) then Places a black dot at position (229, 169) then Places a red circle of radius 18 at center (275, 111).
; PLAN: r0=36(x), r1=53(y), r2=114(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=169(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=111(y), r12=18(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 36
LDI r1, 53
LDI r2, 114
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 169
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 275
LDI r11, 111
LDI r12, 18
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
