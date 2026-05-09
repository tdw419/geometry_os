; DESCRIPTION: Composite: Places a white line segment connecting (263, 145) to (153, 177) then Places a red dot at position (331, 101).
; PLAN: r0=263(x1), r1=145(y1), r2=153(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 145
LDI r2, 153
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
