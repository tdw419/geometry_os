; DESCRIPTION: Composite: Creates a magenta circular shape at (100, 149) with radius 71 then Places a orange line segment connecting (249, 60) to (465, 52).
; PLAN: r0=100(x), r1=149(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x1), r6=60(y1), r7=465(x2), r8=52(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 149
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 60
LDI r7, 465
LDI r8, 52
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
