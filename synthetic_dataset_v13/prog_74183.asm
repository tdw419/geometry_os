; DESCRIPTION: Composite: Renders a orange box of size 108x22 starting at (252, 8) then Draws a orange line from (313, 103) to (395, 173).
; PLAN: r0=252(x), r1=8(y), r2=108(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=103(y1), r7=395(x2), r8=173(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 8
LDI r2, 108
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 103
LDI r7, 395
LDI r8, 173
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
