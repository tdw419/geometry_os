; DESCRIPTION: Composite: Places a yellow line segment connecting (415, 169) to (166, 103) then Places a purple dot at position (230, 187).
; PLAN: r0=415(x1), r1=169(y1), r2=166(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=187(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 169
LDI r2, 166
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 187
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
