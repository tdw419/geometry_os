; DESCRIPTION: Composite: Places a orange line segment connecting (483, 170) to (408, 56) then Renders a cyan box of size 68x119 starting at (383, 115).
; PLAN: r0=483(x1), r1=170(y1), r2=408(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=115(y), r7=68(width), r8=119(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 170
LDI r2, 408
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 115
LDI r7, 68
LDI r8, 119
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
