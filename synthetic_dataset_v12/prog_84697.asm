; DESCRIPTION: Composite: Creates a orange rectangular region at (235, 176) spanning 81 by 72 pixels then Places a orange line segment connecting (404, 133) to (423, 223).
; PLAN: r0=235(x), r1=176(y), r2=81(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x1), r6=133(y1), r7=423(x2), r8=223(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 176
LDI r2, 81
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 133
LDI r7, 423
LDI r8, 223
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
