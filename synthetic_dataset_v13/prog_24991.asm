; DESCRIPTION: Composite: Places a orange dot at position (322, 174) then Places a orange line segment connecting (397, 205) to (345, 156).
; PLAN: r0=322(x), r1=174(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=397(x1), r6=205(y1), r7=345(x2), r8=156(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 174
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 397
LDI r6, 205
LDI r7, 345
LDI r8, 156
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
