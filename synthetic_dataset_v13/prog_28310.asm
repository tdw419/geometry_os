; DESCRIPTION: Composite: Creates a yellow rectangular region at (265, 180) spanning 94 by 34 pixels then Renders a magenta line between points (132, 213) and (419, 111).
; PLAN: r0=265(x), r1=180(y), r2=94(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=213(y1), r7=419(x2), r8=111(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 180
LDI r2, 94
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 213
LDI r7, 419
LDI r8, 111
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
