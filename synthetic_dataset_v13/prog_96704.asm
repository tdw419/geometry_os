; DESCRIPTION: Composite: Renders a green line between points (107, 106) and (193, 48) then Renders a white disk with center (229, 78) and radius 32.
; PLAN: r0=107(x1), r1=106(y1), r2=193(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=78(y), r7=32(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 107
LDI r1, 106
LDI r2, 193
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 78
LDI r7, 32
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
