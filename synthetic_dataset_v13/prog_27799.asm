; DESCRIPTION: Composite: Places a green line segment connecting (160, 227) to (216, 76) then Places a red dot at position (148, 143).
; PLAN: r0=160(x1), r1=227(y1), r2=216(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=143(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 160
LDI r1, 227
LDI r2, 216
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 143
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
