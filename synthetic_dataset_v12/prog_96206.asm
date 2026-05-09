; DESCRIPTION: Composite: Places a green line segment connecting (172, 75) to (309, 92) then Places a orange circle of radius 67 at center (439, 172).
; PLAN: r0=172(x1), r1=75(y1), r2=309(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=439(x), r6=172(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 75
LDI r2, 309
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 172
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
