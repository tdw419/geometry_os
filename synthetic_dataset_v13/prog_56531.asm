; DESCRIPTION: Composite: Places a cyan line segment connecting (444, 223) to (53, 10) then Creates a black circular shape at (290, 151) with radius 60.
; PLAN: r0=444(x1), r1=223(y1), r2=53(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=290(x), r6=151(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 223
LDI r2, 53
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 151
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
