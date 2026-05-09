; DESCRIPTION: Composite: Renders a cyan line between points (466, 108) and (229, 119) then Renders a yellow disk with center (118, 40) and radius 37.
; PLAN: r0=466(x1), r1=108(y1), r2=229(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=40(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 466
LDI r1, 108
LDI r2, 229
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 40
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
