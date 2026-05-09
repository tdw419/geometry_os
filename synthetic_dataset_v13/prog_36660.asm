; DESCRIPTION: Composite: Renders a purple line between points (355, 242) and (281, 1) then Sets a single blue pixel at (234, 198).
; PLAN: r0=355(x1), r1=242(y1), r2=281(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=198(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 355
LDI r1, 242
LDI r2, 281
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 198
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
