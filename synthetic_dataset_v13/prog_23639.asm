; DESCRIPTION: Composite: Renders a green line between points (464, 250) and (50, 106) then Renders a green disk with center (148, 56) and radius 12.
; PLAN: r0=464(x1), r1=250(y1), r2=50(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=56(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 464
LDI r1, 250
LDI r2, 50
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 56
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
