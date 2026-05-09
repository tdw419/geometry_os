; DESCRIPTION: Composite: Draws a yellow line from (344, 124) to (418, 245) then Places a white dot at position (349, 207).
; PLAN: r0=344(x1), r1=124(y1), r2=418(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=207(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 124
LDI r2, 418
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 207
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
