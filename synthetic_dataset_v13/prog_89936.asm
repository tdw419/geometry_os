; DESCRIPTION: Composite: Renders a orange box of size 23x38 starting at (475, 20) then Places a orange line segment connecting (65, 7) to (171, 0).
; PLAN: r0=475(x), r1=20(y), r2=23(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x1), r6=7(y1), r7=171(x2), r8=0(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 20
LDI r2, 23
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 7
LDI r7, 171
LDI r8, 0
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
