; DESCRIPTION: Composite: Places a orange line segment connecting (52, 202) to (307, 1) then Renders a white box of size 82x88 starting at (302, 17).
; PLAN: r0=52(x1), r1=202(y1), r2=307(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=17(y), r7=82(width), r8=88(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 202
LDI r2, 307
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 17
LDI r7, 82
LDI r8, 88
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
