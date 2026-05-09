; DESCRIPTION: Composite: Renders a orange disk with center (90, 71) and radius 52 then Renders a black line between points (294, 134) and (21, 7).
; PLAN: r0=90(x), r1=71(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x1), r6=134(y1), r7=21(x2), r8=7(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 71
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 134
LDI r7, 21
LDI r8, 7
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
