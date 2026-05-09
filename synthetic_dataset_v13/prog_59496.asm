; DESCRIPTION: Composite: Places a orange line segment connecting (128, 95) to (184, 39) then Places a green dot at position (457, 194).
; PLAN: r0=128(x1), r1=95(y1), r2=184(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=194(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 128
LDI r1, 95
LDI r2, 184
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 194
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
