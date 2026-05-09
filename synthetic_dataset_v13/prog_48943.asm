; DESCRIPTION: Composite: Renders a red line between points (234, 122) and (272, 65) then Renders a green disk with center (249, 61) and radius 27.
; PLAN: r0=234(x1), r1=122(y1), r2=272(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=61(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 234
LDI r1, 122
LDI r2, 272
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 61
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
