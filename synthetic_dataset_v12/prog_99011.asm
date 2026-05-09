; DESCRIPTION: Composite: Places a green line segment connecting (452, 98) to (272, 185) then Renders a green disk with center (168, 198) and radius 52.
; PLAN: r0=452(x1), r1=98(y1), r2=272(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=198(y), r7=52(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 452
LDI r1, 98
LDI r2, 272
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 198
LDI r7, 52
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
