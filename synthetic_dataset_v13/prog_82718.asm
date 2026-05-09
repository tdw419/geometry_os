; DESCRIPTION: Composite: Renders a yellow line between points (117, 102) and (279, 142) then Sets a single yellow pixel at (23, 4).
; PLAN: r0=117(x1), r1=102(y1), r2=279(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=4(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 117
LDI r1, 102
LDI r2, 279
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 4
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
