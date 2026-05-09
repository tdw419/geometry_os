; DESCRIPTION: Composite: Creates a orange rectangular region at (389, 228) spanning 26 by 24 pixels then Draws a magenta line from (491, 123) to (41, 168) then Draws a yellow circle centered at (275, 131) with radius 38.
; PLAN: r0=389(x), r1=228(y), r2=26(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x1), r6=123(y1), r7=41(x2), r8=168(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=131(y), r12=38(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 389
LDI r1, 228
LDI r2, 26
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 123
LDI r7, 41
LDI r8, 168
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 131
LDI r12, 38
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
