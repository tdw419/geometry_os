; DESCRIPTION: Composite: Places a orange line segment connecting (453, 229) to (286, 10) then Renders a magenta box of size 88x58 starting at (411, 61).
; PLAN: r0=453(x1), r1=229(y1), r2=286(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=61(y), r7=88(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 229
LDI r2, 286
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 61
LDI r7, 88
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
