; DESCRIPTION: Composite: Renders a blue disk with center (353, 86) and radius 65 then Renders a yellow line between points (193, 134) and (283, 60).
; PLAN: r0=353(x), r1=86(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=134(y1), r7=283(x2), r8=60(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 353
LDI r1, 86
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 134
LDI r7, 283
LDI r8, 60
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
