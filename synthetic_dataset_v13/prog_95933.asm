; DESCRIPTION: Composite: Places a black line segment connecting (276, 188) to (335, 131) then Creates a cyan rectangular region at (348, 129) spanning 38 by 110 pixels then Renders a black disk with center (384, 162) and radius 31.
; PLAN: r0=276(x1), r1=188(y1), r2=335(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=129(y), r7=38(width), r8=110(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x), r11=162(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 276
LDI r1, 188
LDI r2, 335
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 129
LDI r7, 38
LDI r8, 110
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 162
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
