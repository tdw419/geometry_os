; DESCRIPTION: Composite: Draws a yellow rectangle at (234, 199) with width 37 and height 24 then Renders a red line between points (417, 34) and (290, 12).
; PLAN: r0=234(x), r1=199(y), r2=37(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x1), r6=34(y1), r7=290(x2), r8=12(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 199
LDI r2, 37
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 34
LDI r7, 290
LDI r8, 12
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
