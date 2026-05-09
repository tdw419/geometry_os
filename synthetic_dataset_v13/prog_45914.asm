; DESCRIPTION: Composite: Creates a orange circular shape at (159, 168) with radius 58 then Draws a black line from (295, 182) to (116, 232).
; PLAN: r0=159(x), r1=168(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x1), r6=182(y1), r7=116(x2), r8=232(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 168
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 182
LDI r7, 116
LDI r8, 232
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
