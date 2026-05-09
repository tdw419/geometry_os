; DESCRIPTION: Composite: Renders a orange disk with center (356, 99) and radius 74 then Renders a white line between points (186, 149) and (77, 124).
; PLAN: r0=356(x), r1=99(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x1), r6=149(y1), r7=77(x2), r8=124(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 99
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 149
LDI r7, 77
LDI r8, 124
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
