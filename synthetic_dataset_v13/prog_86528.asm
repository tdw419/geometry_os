; DESCRIPTION: Composite: Renders a orange disk with center (416, 133) and radius 78 then Places a red line segment connecting (167, 19) to (37, 165).
; PLAN: r0=416(x), r1=133(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=167(x1), r6=19(y1), r7=37(x2), r8=165(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 133
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 167
LDI r6, 19
LDI r7, 37
LDI r8, 165
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
