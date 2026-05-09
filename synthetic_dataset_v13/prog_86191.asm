; DESCRIPTION: Composite: Renders a green disk with center (394, 94) and radius 33 then Renders a purple line between points (48, 154) and (122, 117).
; PLAN: r0=394(x), r1=94(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x1), r6=154(y1), r7=122(x2), r8=117(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 94
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 154
LDI r7, 122
LDI r8, 117
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
