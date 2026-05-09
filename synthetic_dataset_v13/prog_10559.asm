; DESCRIPTION: Composite: Places a white dot at position (365, 134) then Places a orange line segment connecting (436, 218) to (455, 112).
; PLAN: r0=365(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=436(x1), r6=218(y1), r7=455(x2), r8=112(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 436
LDI r6, 218
LDI r7, 455
LDI r8, 112
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
