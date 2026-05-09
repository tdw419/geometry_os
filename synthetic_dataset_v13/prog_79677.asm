; DESCRIPTION: Composite: Renders a purple line between points (243, 34) and (202, 43) then Places a purple dot at position (506, 35) then Creates a blue rectangular region at (36, 31) spanning 79 by 107 pixels.
; PLAN: r0=243(x1), r1=34(y1), r2=202(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=506(x), r6=35(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=36(x), r11=31(y), r12=79(width), r13=107(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 34
LDI r2, 202
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 35
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 36
LDI r11, 31
LDI r12, 79
LDI r13, 107
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
