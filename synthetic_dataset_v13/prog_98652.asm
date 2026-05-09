; DESCRIPTION: Composite: Renders a blue line between points (306, 35) and (144, 194) then Creates a green circular shape at (116, 33) with radius 11.
; PLAN: r0=306(x1), r1=35(y1), r2=144(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=116(x), r6=33(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 306
LDI r1, 35
LDI r2, 144
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 33
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
