; DESCRIPTION: Composite: Places a black line segment connecting (171, 182) to (199, 39) then Draws a orange rectangle at (402, 116) with width 96 and height 79.
; PLAN: r0=171(x1), r1=182(y1), r2=199(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=116(y), r7=96(width), r8=79(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 182
LDI r2, 199
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 116
LDI r7, 96
LDI r8, 79
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
