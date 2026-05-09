; DESCRIPTION: Composite: Draws a green line from (297, 236) to (407, 205) then Places a yellow dot at position (193, 124).
; PLAN: r0=297(x1), r1=236(y1), r2=407(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=124(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 297
LDI r1, 236
LDI r2, 407
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 124
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
