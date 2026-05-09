; DESCRIPTION: Composite: Draws a cyan line from (131, 58) to (137, 236) then Places a green dot at position (486, 47).
; PLAN: r0=131(x1), r1=58(y1), r2=137(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=486(x), r6=47(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 131
LDI r1, 58
LDI r2, 137
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 47
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
