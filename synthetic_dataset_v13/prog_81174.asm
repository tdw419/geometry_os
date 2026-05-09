; DESCRIPTION: Composite: Places a orange line segment connecting (509, 179) to (339, 20) then Places a blue dot at position (54, 255).
; PLAN: r0=509(x1), r1=179(y1), r2=339(x2), r3=20(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=255(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 509
LDI r1, 179
LDI r2, 339
LDI r3, 20
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 255
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
