; DESCRIPTION: Composite: Renders a yellow line between points (238, 177) and (34, 14) then Places a green dot at position (436, 79).
; PLAN: r0=238(x1), r1=177(y1), r2=34(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=79(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 177
LDI r2, 34
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 79
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
