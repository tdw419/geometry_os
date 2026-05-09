; DESCRIPTION: Composite: Places a yellow dot at position (196, 172) then Creates a yellow circular shape at (410, 68) with radius 40 then Draws a purple line from (32, 199) to (444, 34).
; PLAN: r0=196(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=68(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=32(x1), r11=199(y1), r12=444(x2), r13=34(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 68
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 32
LDI r11, 199
LDI r12, 444
LDI r13, 34
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
