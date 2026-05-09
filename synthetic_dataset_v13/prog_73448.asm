; DESCRIPTION: Composite: Renders a orange disk with center (95, 58) and radius 49 then Renders a red line between points (295, 231) and (426, 45).
; PLAN: r0=95(x), r1=58(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x1), r6=231(y1), r7=426(x2), r8=45(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 58
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 231
LDI r7, 426
LDI r8, 45
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
