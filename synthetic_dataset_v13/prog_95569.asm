; DESCRIPTION: Composite: Places a orange line segment connecting (150, 116) to (134, 133) then Renders a red box of size 104x62 starting at (33, 184).
; PLAN: r0=150(x1), r1=116(y1), r2=134(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=184(y), r7=104(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 116
LDI r2, 134
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 184
LDI r7, 104
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
