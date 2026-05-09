; DESCRIPTION: Composite: Creates a yellow circular shape at (483, 223) with radius 17 then Renders a green box of size 68x89 starting at (34, 9).
; PLAN: r0=483(x), r1=223(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=9(y), r7=68(width), r8=89(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 223
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 9
LDI r7, 68
LDI r8, 89
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
