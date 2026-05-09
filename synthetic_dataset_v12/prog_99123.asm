; DESCRIPTION: Composite: Draws a orange circle centered at (313, 155) with radius 70 then Places a red line segment connecting (346, 41) to (21, 168).
; PLAN: r0=313(x), r1=155(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x1), r6=41(y1), r7=21(x2), r8=168(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 155
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 41
LDI r7, 21
LDI r8, 168
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
