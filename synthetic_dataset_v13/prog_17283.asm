; DESCRIPTION: Composite: Creates a orange circular shape at (457, 187) with radius 25 then Renders a yellow line between points (507, 192) and (138, 86).
; PLAN: r0=457(x), r1=187(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x1), r6=192(y1), r7=138(x2), r8=86(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 187
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 192
LDI r7, 138
LDI r8, 86
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
