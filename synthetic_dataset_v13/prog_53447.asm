; DESCRIPTION: Composite: Renders a white line between points (336, 122) and (490, 172) then Creates a red rectangular region at (39, 105) spanning 92 by 17 pixels.
; PLAN: r0=336(x1), r1=122(y1), r2=490(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=39(x), r6=105(y), r7=92(width), r8=17(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 122
LDI r2, 490
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 105
LDI r7, 92
LDI r8, 17
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
