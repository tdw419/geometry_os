; DESCRIPTION: Composite: Places a orange dot at position (334, 182) then Draws a orange circle centered at (388, 76) with radius 59 then Draws a white line from (253, 254) to (454, 204).
; PLAN: r0=334(x), r1=182(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=76(y), r7=59(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x1), r11=254(y1), r12=454(x2), r13=204(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 182
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 388
LDI r6, 76
LDI r7, 59
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 254
LDI r12, 454
LDI r13, 204
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
