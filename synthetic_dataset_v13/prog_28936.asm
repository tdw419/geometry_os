; DESCRIPTION: Composite: Renders a blue line between points (456, 58) and (372, 182) then Places a orange dot at position (368, 34).
; PLAN: r0=456(x1), r1=58(y1), r2=372(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=34(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 456
LDI r1, 58
LDI r2, 372
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 34
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
