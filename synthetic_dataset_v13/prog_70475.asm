; DESCRIPTION: Composite: Sets a single blue pixel at (385, 135) then Places a orange line segment connecting (354, 227) to (124, 16).
; PLAN: r0=385(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=354(x1), r6=227(y1), r7=124(x2), r8=16(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 354
LDI r6, 227
LDI r7, 124
LDI r8, 16
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
