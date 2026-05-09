; DESCRIPTION: Composite: Draws a red line from (374, 208) to (188, 11) then Creates a orange circular shape at (246, 126) with radius 32.
; PLAN: r0=374(x1), r1=208(y1), r2=188(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=126(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 374
LDI r1, 208
LDI r2, 188
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 126
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
