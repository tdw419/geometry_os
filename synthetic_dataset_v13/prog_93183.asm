; DESCRIPTION: Composite: Places a white line segment connecting (110, 61) to (452, 194) then Renders a green disk with center (384, 138) and radius 54.
; PLAN: r0=110(x1), r1=61(y1), r2=452(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=384(x), r6=138(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 61
LDI r2, 452
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 138
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
