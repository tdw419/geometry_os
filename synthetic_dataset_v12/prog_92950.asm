; DESCRIPTION: Composite: Draws a cyan line from (33, 160) to (290, 150) then Creates a orange rectangular region at (290, 3) spanning 52 by 40 pixels then Places a orange circle of radius 13 at center (66, 191).
; PLAN: r0=33(x1), r1=160(y1), r2=290(x2), r3=150(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=3(y), r7=52(width), r8=40(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=66(x), r11=191(y), r12=13(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 160
LDI r2, 290
LDI r3, 150
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 3
LDI r7, 52
LDI r8, 40
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 191
LDI r12, 13
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
