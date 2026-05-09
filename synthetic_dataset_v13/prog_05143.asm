; DESCRIPTION: Composite: Draws a red line from (465, 188) to (418, 133) then Places a white dot at position (405, 225).
; PLAN: r0=465(x1), r1=188(y1), r2=418(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=405(x), r6=225(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 465
LDI r1, 188
LDI r2, 418
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 225
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
