; DESCRIPTION: Composite: Places a orange line segment connecting (43, 25) to (210, 223) then Creates a white circular shape at (438, 129) with radius 42.
; PLAN: r0=43(x1), r1=25(y1), r2=210(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=129(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 25
LDI r2, 210
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 129
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
