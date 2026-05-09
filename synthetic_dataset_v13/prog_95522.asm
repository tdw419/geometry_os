; DESCRIPTION: Composite: Places a white 80x89 rectangle at position (355, 38) then Creates a magenta circular shape at (306, 85) with radius 10.
; PLAN: r0=355(x), r1=38(y), r2=80(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=85(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 355
LDI r1, 38
LDI r2, 80
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 85
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
