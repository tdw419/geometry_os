; DESCRIPTION: Composite: Renders a cyan line between points (315, 164) and (301, 234) then Creates a green circular shape at (369, 151) with radius 62.
; PLAN: r0=315(x1), r1=164(y1), r2=301(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=151(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 164
LDI r2, 301
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 151
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
