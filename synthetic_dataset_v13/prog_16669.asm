; DESCRIPTION: Composite: Places a white dot at position (496, 204) then Renders a purple line between points (319, 177) and (256, 151).
; PLAN: r0=496(x), r1=204(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=319(x1), r6=177(y1), r7=256(x2), r8=151(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 496
LDI r1, 204
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 177
LDI r7, 256
LDI r8, 151
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
