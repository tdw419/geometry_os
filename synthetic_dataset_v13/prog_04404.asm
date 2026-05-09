; DESCRIPTION: Composite: Places a red dot at position (15, 64) then Renders a black line between points (194, 162) and (228, 232).
; PLAN: r0=15(x), r1=64(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=194(x1), r6=162(y1), r7=228(x2), r8=232(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 15
LDI r1, 64
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 194
LDI r6, 162
LDI r7, 228
LDI r8, 232
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
