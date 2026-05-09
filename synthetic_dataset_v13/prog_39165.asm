; DESCRIPTION: Composite: Renders a green line between points (241, 19) and (4, 72) then Places a yellow dot at position (373, 97) then Creates a purple rectangular region at (194, 77) spanning 44 by 77 pixels.
; PLAN: r0=241(x1), r1=19(y1), r2=4(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=97(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=77(y), r12=44(width), r13=77(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 19
LDI r2, 4
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 97
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 194
LDI r11, 77
LDI r12, 44
LDI r13, 77
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
