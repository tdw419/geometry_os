; DESCRIPTION: Composite: Places a purple circle of radius 34 at center (454, 171) then Renders a magenta line between points (108, 98) and (483, 100).
; PLAN: r0=454(x), r1=171(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x1), r6=98(y1), r7=483(x2), r8=100(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 171
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 98
LDI r7, 483
LDI r8, 100
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
