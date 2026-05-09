; DESCRIPTION: Composite: Creates a orange circular shape at (336, 83) with radius 58 then Renders a magenta line between points (181, 196) and (141, 39).
; PLAN: r0=336(x), r1=83(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=181(x1), r6=196(y1), r7=141(x2), r8=39(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 83
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 181
LDI r6, 196
LDI r7, 141
LDI r8, 39
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
