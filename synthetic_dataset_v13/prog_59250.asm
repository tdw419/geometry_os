; DESCRIPTION: Composite: Creates a white rectangular region at (442, 58) spanning 35 by 100 pixels then Places a white line segment connecting (358, 91) to (315, 240).
; PLAN: r0=442(x), r1=58(y), r2=35(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x1), r6=91(y1), r7=315(x2), r8=240(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 58
LDI r2, 35
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 91
LDI r7, 315
LDI r8, 240
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
