; DESCRIPTION: Composite: Creates a orange rectangular region at (224, 175) spanning 86 by 52 pixels then Draws a red line from (152, 181) to (340, 121).
; PLAN: r0=224(x), r1=175(y), r2=86(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x1), r6=181(y1), r7=340(x2), r8=121(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 175
LDI r2, 86
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 181
LDI r7, 340
LDI r8, 121
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
