; DESCRIPTION: Composite: Places a orange line segment connecting (64, 158) to (483, 38) then Places a red dot at position (320, 21).
; PLAN: r0=64(x1), r1=158(y1), r2=483(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=21(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 64
LDI r1, 158
LDI r2, 483
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 21
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
