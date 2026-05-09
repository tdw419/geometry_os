; DESCRIPTION: Composite: Draws a red circle centered at (193, 158) with radius 10 then Renders a cyan line between points (414, 101) and (113, 236).
; PLAN: r0=193(x), r1=158(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x1), r6=101(y1), r7=113(x2), r8=236(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 158
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 101
LDI r7, 113
LDI r8, 236
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
