; DESCRIPTION: Composite: Places a black dot at position (301, 206) then Places a purple line segment connecting (459, 90) to (156, 71).
; PLAN: r0=301(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=459(x1), r6=90(y1), r7=156(x2), r8=71(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 459
LDI r6, 90
LDI r7, 156
LDI r8, 71
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
