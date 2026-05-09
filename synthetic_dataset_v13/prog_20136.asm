; DESCRIPTION: Composite: Renders a cyan line between points (368, 191) and (147, 148) then Places a red dot at position (105, 70).
; PLAN: r0=368(x1), r1=191(y1), r2=147(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=105(x), r6=70(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 368
LDI r1, 191
LDI r2, 147
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 70
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
