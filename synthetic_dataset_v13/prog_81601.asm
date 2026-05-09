; DESCRIPTION: Composite: Renders a orange box of size 37x85 starting at (288, 22) then Draws a magenta line from (501, 28) to (172, 72).
; PLAN: r0=288(x), r1=22(y), r2=37(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x1), r6=28(y1), r7=172(x2), r8=72(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 22
LDI r2, 37
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 28
LDI r7, 172
LDI r8, 72
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
