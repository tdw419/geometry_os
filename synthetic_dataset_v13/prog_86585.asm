; DESCRIPTION: Composite: Places a blue dot at position (461, 143) then Renders a purple line between points (73, 21) and (128, 25).
; PLAN: r0=461(x), r1=143(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=73(x1), r6=21(y1), r7=128(x2), r8=25(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 143
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 21
LDI r7, 128
LDI r8, 25
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
