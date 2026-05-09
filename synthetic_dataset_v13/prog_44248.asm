; DESCRIPTION: Composite: Creates a green circular shape at (405, 49) with radius 36 then Renders a red line between points (81, 6) and (156, 161).
; PLAN: r0=405(x), r1=49(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=6(y1), r7=156(x2), r8=161(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 49
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 6
LDI r7, 156
LDI r8, 161
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
