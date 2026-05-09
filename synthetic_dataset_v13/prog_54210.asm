; DESCRIPTION: Composite: Draws a yellow line from (98, 118) to (157, 214) then Places a cyan dot at position (207, 249).
; PLAN: r0=98(x1), r1=118(y1), r2=157(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=249(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 98
LDI r1, 118
LDI r2, 157
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 249
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
