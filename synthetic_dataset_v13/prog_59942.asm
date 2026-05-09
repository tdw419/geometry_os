; DESCRIPTION: Composite: Places a magenta line segment connecting (417, 236) to (327, 162) then Places a purple dot at position (310, 148).
; PLAN: r0=417(x1), r1=236(y1), r2=327(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=148(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 236
LDI r2, 327
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 148
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
