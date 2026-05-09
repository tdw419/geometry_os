; DESCRIPTION: Composite: Draws a orange circle centered at (75, 180) with radius 14 then Places a orange line segment connecting (360, 176) to (482, 16).
; PLAN: r0=75(x), r1=180(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x1), r6=176(y1), r7=482(x2), r8=16(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 180
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 176
LDI r7, 482
LDI r8, 16
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
