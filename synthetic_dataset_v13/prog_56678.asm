; DESCRIPTION: Composite: Renders a cyan line between points (357, 2) and (402, 60) then Renders a green disk with center (112, 82) and radius 11.
; PLAN: r0=357(x1), r1=2(y1), r2=402(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=82(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 357
LDI r1, 2
LDI r2, 402
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 82
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
