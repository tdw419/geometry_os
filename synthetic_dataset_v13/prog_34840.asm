; DESCRIPTION: Composite: Creates a blue rectangular region at (146, 82) spanning 90 by 111 pixels then Draws a yellow line from (204, 118) to (378, 38).
; PLAN: r0=146(x), r1=82(y), r2=90(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x1), r6=118(y1), r7=378(x2), r8=38(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 82
LDI r2, 90
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 118
LDI r7, 378
LDI r8, 38
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
