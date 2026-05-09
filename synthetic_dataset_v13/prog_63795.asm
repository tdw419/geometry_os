; DESCRIPTION: Composite: Renders a orange disk with center (434, 121) and radius 70 then Places a orange line segment connecting (104, 140) to (286, 45).
; PLAN: r0=434(x), r1=121(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=140(y1), r7=286(x2), r8=45(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 434
LDI r1, 121
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 140
LDI r7, 286
LDI r8, 45
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
