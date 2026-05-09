; DESCRIPTION: Composite: Creates a yellow circular shape at (193, 150) with radius 24 then Renders a orange line between points (357, 98) and (7, 72).
; PLAN: r0=193(x), r1=150(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x1), r6=98(y1), r7=7(x2), r8=72(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 150
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 98
LDI r7, 7
LDI r8, 72
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
