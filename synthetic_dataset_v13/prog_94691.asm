; DESCRIPTION: Composite: Places a magenta line segment connecting (437, 128) to (311, 54) then Places a blue dot at position (322, 116).
; PLAN: r0=437(x1), r1=128(y1), r2=311(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=116(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 128
LDI r2, 311
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 116
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
