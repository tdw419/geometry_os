; DESCRIPTION: Composite: Renders a orange box of size 59x109 starting at (159, 13) then Places a yellow line segment connecting (74, 119) to (441, 218).
; PLAN: r0=159(x), r1=13(y), r2=59(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=119(y1), r7=441(x2), r8=218(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 13
LDI r2, 59
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 119
LDI r7, 441
LDI r8, 218
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
