; DESCRIPTION: Composite: Renders a white disk with center (176, 74) and radius 36 then Places a orange line segment connecting (10, 84) to (310, 231).
; PLAN: r0=176(x), r1=74(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x1), r6=84(y1), r7=310(x2), r8=231(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 74
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 84
LDI r7, 310
LDI r8, 231
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
