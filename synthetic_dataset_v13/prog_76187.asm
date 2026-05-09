; DESCRIPTION: Composite: Draws a yellow rectangle at (31, 31) with width 110 and height 119 then Renders a cyan line between points (186, 52) and (368, 76).
; PLAN: r0=31(x), r1=31(y), r2=110(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x1), r6=52(y1), r7=368(x2), r8=76(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 31
LDI r2, 110
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 52
LDI r7, 368
LDI r8, 76
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
