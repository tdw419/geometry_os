; DESCRIPTION: Composite: Places a orange line segment connecting (333, 83) to (356, 56) then Places a red dot at position (383, 17).
; PLAN: r0=333(x1), r1=83(y1), r2=356(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=383(x), r6=17(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 83
LDI r2, 356
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 17
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
