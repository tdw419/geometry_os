; DESCRIPTION: Composite: Renders a cyan line between points (437, 223) and (3, 181) then Places a black dot at position (197, 98).
; PLAN: r0=437(x1), r1=223(y1), r2=3(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=98(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 223
LDI r2, 3
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 98
LDI r7, 0x000000
PSET r5, r6, r7
HALT
