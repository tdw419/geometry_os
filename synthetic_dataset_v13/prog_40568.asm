; DESCRIPTION: Composite: Places a magenta line segment connecting (31, 116) to (57, 7) then Draws a orange rectangle at (367, 20) with width 54 and height 54 then Places a orange circle of radius 28 at center (301, 37).
; PLAN: r0=31(x1), r1=116(y1), r2=57(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=20(y), r7=54(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=301(x), r11=37(y), r12=28(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 116
LDI r2, 57
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 20
LDI r7, 54
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 37
LDI r12, 28
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
