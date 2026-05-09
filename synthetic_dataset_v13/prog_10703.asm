; DESCRIPTION: Composite: Draws a white line from (411, 96) to (118, 130) then Creates a yellow rectangular region at (297, 85) spanning 77 by 42 pixels then Creates a orange circular shape at (327, 115) with radius 16.
; PLAN: r0=411(x1), r1=96(y1), r2=118(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=85(y), r7=77(width), r8=42(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x), r11=115(y), r12=16(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 411
LDI r1, 96
LDI r2, 118
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 85
LDI r7, 77
LDI r8, 42
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 115
LDI r12, 16
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
