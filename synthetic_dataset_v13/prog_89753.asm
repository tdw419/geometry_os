; DESCRIPTION: Composite: Places a red line segment connecting (289, 15) to (334, 133) then Renders a magenta box of size 97x34 starting at (80, 73).
; PLAN: r0=289(x1), r1=15(y1), r2=334(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=73(y), r7=97(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 15
LDI r2, 334
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 73
LDI r7, 97
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
