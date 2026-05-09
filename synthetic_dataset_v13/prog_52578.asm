; DESCRIPTION: Composite: Renders a yellow box of size 108x25 starting at (150, 199) then Renders a purple line between points (292, 182) and (77, 250).
; PLAN: r0=150(x), r1=199(y), r2=108(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x1), r6=182(y1), r7=77(x2), r8=250(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 199
LDI r2, 108
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 182
LDI r7, 77
LDI r8, 250
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
