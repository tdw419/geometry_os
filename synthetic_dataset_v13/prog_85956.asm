; DESCRIPTION: Composite: Renders a white box of size 45x77 starting at (138, 16) then Places a orange line segment connecting (349, 244) to (75, 25).
; PLAN: r0=138(x), r1=16(y), r2=45(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=244(y1), r7=75(x2), r8=25(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 16
LDI r2, 45
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 244
LDI r7, 75
LDI r8, 25
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
