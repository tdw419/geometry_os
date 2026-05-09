; DESCRIPTION: Composite: Renders a green line between points (413, 22) and (329, 99) then Places a orange dot at position (177, 115).
; PLAN: r0=413(x1), r1=22(y1), r2=329(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=177(x), r6=115(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 413
LDI r1, 22
LDI r2, 329
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 115
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
