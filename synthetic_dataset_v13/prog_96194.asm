; DESCRIPTION: Composite: Places a orange line segment connecting (429, 64) to (458, 10) then Renders a purple box of size 88x21 starting at (229, 124).
; PLAN: r0=429(x1), r1=64(y1), r2=458(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=124(y), r7=88(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 64
LDI r2, 458
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 124
LDI r7, 88
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
