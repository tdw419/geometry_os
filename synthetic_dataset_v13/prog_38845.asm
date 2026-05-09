; DESCRIPTION: Composite: Renders a cyan line between points (19, 212) and (333, 106) then Places a green dot at position (142, 217).
; PLAN: r0=19(x1), r1=212(y1), r2=333(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=217(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 212
LDI r2, 333
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 217
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
