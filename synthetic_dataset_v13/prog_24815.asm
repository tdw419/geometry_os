; DESCRIPTION: Composite: Renders a black box of size 78x10 starting at (253, 43) then Places a orange line segment connecting (335, 171) to (354, 89).
; PLAN: r0=253(x), r1=43(y), r2=78(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x1), r6=171(y1), r7=354(x2), r8=89(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 43
LDI r2, 78
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 171
LDI r7, 354
LDI r8, 89
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
