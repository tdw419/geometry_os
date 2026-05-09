; DESCRIPTION: Composite: Places a orange line segment connecting (308, 242) to (234, 216) then Renders a magenta box of size 109x34 starting at (373, 158).
; PLAN: r0=308(x1), r1=242(y1), r2=234(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=158(y), r7=109(width), r8=34(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 242
LDI r2, 234
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 158
LDI r7, 109
LDI r8, 34
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
