; DESCRIPTION: Composite: Places a cyan line segment connecting (132, 44) to (360, 117) then Creates a orange circular shape at (458, 95) with radius 50.
; PLAN: r0=132(x1), r1=44(y1), r2=360(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=95(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 44
LDI r2, 360
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 95
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
