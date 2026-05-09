; DESCRIPTION: Composite: Draws a white line from (269, 182) to (353, 188) then Creates a blue rectangular region at (163, 164) spanning 15 by 48 pixels.
; PLAN: r0=269(x1), r1=182(y1), r2=353(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=164(y), r7=15(width), r8=48(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 182
LDI r2, 353
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 164
LDI r7, 15
LDI r8, 48
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
