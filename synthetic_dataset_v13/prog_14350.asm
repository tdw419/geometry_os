; DESCRIPTION: Composite: Renders a green box of size 65x80 starting at (128, 170) then Places a orange line segment connecting (471, 32) to (47, 168).
; PLAN: r0=128(x), r1=170(y), r2=65(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x1), r6=32(y1), r7=47(x2), r8=168(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 170
LDI r2, 65
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 32
LDI r7, 47
LDI r8, 168
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
