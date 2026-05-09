; DESCRIPTION: Composite: Creates a white rectangular region at (396, 150) spanning 68 by 41 pixels then Draws a orange line from (500, 9) to (447, 242) then Places a red circle of radius 32 at center (465, 186).
; PLAN: r0=396(x), r1=150(y), r2=68(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=500(x1), r6=9(y1), r7=447(x2), r8=242(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=465(x), r11=186(y), r12=32(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 150
LDI r2, 68
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 9
LDI r7, 447
LDI r8, 242
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 186
LDI r12, 32
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
