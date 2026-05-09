; DESCRIPTION: Composite: Places a green line segment connecting (258, 18) to (245, 96) then Places a red dot at position (163, 165).
; PLAN: r0=258(x1), r1=18(y1), r2=245(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=165(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 18
LDI r2, 245
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 165
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
