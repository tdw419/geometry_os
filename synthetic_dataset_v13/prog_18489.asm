; DESCRIPTION: Composite: Renders a orange disk with center (364, 57) and radius 42 then Renders a cyan line between points (463, 11) and (341, 22).
; PLAN: r0=364(x), r1=57(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=11(y1), r7=341(x2), r8=22(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 57
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 11
LDI r7, 341
LDI r8, 22
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
