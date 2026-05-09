; DESCRIPTION: Composite: Places a black dot at position (344, 228) then Places a magenta line segment connecting (431, 199) to (160, 245).
; PLAN: r0=344(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=431(x1), r6=199(y1), r7=160(x2), r8=245(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 228
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 431
LDI r6, 199
LDI r7, 160
LDI r8, 245
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
