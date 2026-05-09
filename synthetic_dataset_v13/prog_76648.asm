; DESCRIPTION: Composite: Renders a green line between points (126, 125) and (65, 21) then Creates a white circular shape at (140, 198) with radius 58.
; PLAN: r0=126(x1), r1=125(y1), r2=65(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=198(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 126
LDI r1, 125
LDI r2, 65
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 198
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
