; DESCRIPTION: Composite: Draws a orange line from (454, 3) to (391, 88) then Renders a orange box of size 55x42 starting at (313, 169).
; PLAN: r0=454(x1), r1=3(y1), r2=391(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=169(y), r7=55(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 3
LDI r2, 391
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 169
LDI r7, 55
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
