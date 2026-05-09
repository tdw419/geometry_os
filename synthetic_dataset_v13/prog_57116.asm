; DESCRIPTION: Composite: Renders a green line between points (171, 87) and (123, 252) then Creates a red circular shape at (302, 150) with radius 78.
; PLAN: r0=171(x1), r1=87(y1), r2=123(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=150(y), r7=78(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 171
LDI r1, 87
LDI r2, 123
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 150
LDI r7, 78
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
