; DESCRIPTION: Composite: Places a purple line segment connecting (114, 83) to (475, 46) then Creates a magenta circular shape at (300, 174) with radius 24.
; PLAN: r0=114(x1), r1=83(y1), r2=475(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=174(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 83
LDI r2, 475
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 174
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
