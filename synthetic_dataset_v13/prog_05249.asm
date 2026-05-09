; DESCRIPTION: Composite: Creates a yellow circular shape at (369, 181) with radius 35 then Renders a red line between points (299, 39) and (148, 156).
; PLAN: r0=369(x), r1=181(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=299(x1), r6=39(y1), r7=148(x2), r8=156(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 181
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 299
LDI r6, 39
LDI r7, 148
LDI r8, 156
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
