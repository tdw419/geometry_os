; DESCRIPTION: Composite: Draws a red line from (506, 246) to (158, 99) then Renders a cyan disk with center (428, 44) and radius 43.
; PLAN: r0=506(x1), r1=246(y1), r2=158(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=44(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 506
LDI r1, 246
LDI r2, 158
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 44
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
