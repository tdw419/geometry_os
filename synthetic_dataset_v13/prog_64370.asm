; DESCRIPTION: Composite: Renders a orange line between points (285, 100) and (95, 182) then Renders a yellow box of size 100x59 starting at (378, 163).
; PLAN: r0=285(x1), r1=100(y1), r2=95(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=163(y), r7=100(width), r8=59(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 100
LDI r2, 95
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 163
LDI r7, 100
LDI r8, 59
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
