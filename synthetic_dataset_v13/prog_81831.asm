; DESCRIPTION: Composite: Draws a white line from (465, 171) to (288, 12) then Creates a green rectangular region at (456, 13) spanning 49 by 69 pixels then Creates a cyan circular shape at (348, 165) with radius 77.
; PLAN: r0=465(x1), r1=171(y1), r2=288(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=13(y), r7=49(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=348(x), r11=165(y), r12=77(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 465
LDI r1, 171
LDI r2, 288
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 13
LDI r7, 49
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 165
LDI r12, 77
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
