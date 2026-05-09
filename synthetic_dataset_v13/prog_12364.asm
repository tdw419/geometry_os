; DESCRIPTION: Composite: Draws a red line from (42, 61) to (110, 175) then Creates a red rectangular region at (275, 122) spanning 70 by 72 pixels then Places a magenta circle of radius 53 at center (313, 173).
; PLAN: r0=42(x1), r1=61(y1), r2=110(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=122(y), r7=70(width), r8=72(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x), r11=173(y), r12=53(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 42
LDI r1, 61
LDI r2, 110
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 122
LDI r7, 70
LDI r8, 72
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 173
LDI r12, 53
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
