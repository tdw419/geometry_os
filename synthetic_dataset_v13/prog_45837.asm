; DESCRIPTION: Composite: Draws a blue line from (351, 36) to (77, 134) then Creates a blue rectangular region at (92, 4) spanning 101 by 10 pixels.
; PLAN: r0=351(x1), r1=36(y1), r2=77(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=4(y), r7=101(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 36
LDI r2, 77
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 4
LDI r7, 101
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
