; DESCRIPTION: Composite: Draws a green circle centered at (40, 212) with radius 21 then Renders a red line between points (463, 218) and (156, 229) then Places a magenta dot at position (234, 93).
; PLAN: r0=40(x), r1=212(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=218(y1), r7=156(x2), r8=229(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=93(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 212
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 218
LDI r7, 156
LDI r8, 229
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 93
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
