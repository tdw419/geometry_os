; DESCRIPTION: Composite: Draws a red circle centered at (255, 67) with radius 43 then Renders a purple line between points (98, 81) and (101, 52).
; PLAN: r0=255(x), r1=67(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=81(y1), r7=101(x2), r8=52(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 67
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 81
LDI r7, 101
LDI r8, 52
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
