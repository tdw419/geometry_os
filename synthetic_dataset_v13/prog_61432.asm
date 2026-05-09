; DESCRIPTION: Composite: Draws a green line from (308, 251) to (468, 173) then Creates a black rectangular region at (45, 29) spanning 88 by 20 pixels.
; PLAN: r0=308(x1), r1=251(y1), r2=468(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=29(y), r7=88(width), r8=20(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 251
LDI r2, 468
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 29
LDI r7, 88
LDI r8, 20
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
