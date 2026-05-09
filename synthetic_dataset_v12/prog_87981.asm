; DESCRIPTION: Composite: Creates a orange rectangular region at (184, 3) spanning 100 by 92 pixels then Draws a purple line from (465, 146) to (172, 42) then Renders a purple disk with center (161, 85) and radius 76.
; PLAN: r0=184(x), r1=3(y), r2=100(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x1), r6=146(y1), r7=172(x2), r8=42(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=161(x), r11=85(y), r12=76(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 184
LDI r1, 3
LDI r2, 100
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 146
LDI r7, 172
LDI r8, 42
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 85
LDI r12, 76
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
