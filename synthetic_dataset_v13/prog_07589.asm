; DESCRIPTION: Composite: Renders a orange box of size 18x109 starting at (247, 108) then Places a red line segment connecting (371, 74) to (20, 169).
; PLAN: r0=247(x), r1=108(y), r2=18(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=74(y1), r7=20(x2), r8=169(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 108
LDI r2, 18
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 74
LDI r7, 20
LDI r8, 169
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
