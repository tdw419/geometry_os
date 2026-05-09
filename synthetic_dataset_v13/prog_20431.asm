; DESCRIPTION: Composite: Places a orange line segment connecting (504, 39) to (445, 222) then Places a purple dot at position (238, 185).
; PLAN: r0=504(x1), r1=39(y1), r2=445(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=185(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 504
LDI r1, 39
LDI r2, 445
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 185
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
