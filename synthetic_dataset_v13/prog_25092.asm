; DESCRIPTION: Composite: Creates a blue rectangular region at (397, 108) spanning 87 by 104 pixels then Renders a cyan line between points (498, 169) and (413, 202).
; PLAN: r0=397(x), r1=108(y), r2=87(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=498(x1), r6=169(y1), r7=413(x2), r8=202(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 108
LDI r2, 87
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 498
LDI r6, 169
LDI r7, 413
LDI r8, 202
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
