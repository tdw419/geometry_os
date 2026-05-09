; DESCRIPTION: Composite: Renders a green line between points (340, 164) and (335, 123) then Creates a white circular shape at (78, 189) with radius 57.
; PLAN: r0=340(x1), r1=164(y1), r2=335(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=189(y), r7=57(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 340
LDI r1, 164
LDI r2, 335
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 189
LDI r7, 57
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
