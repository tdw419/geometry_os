; DESCRIPTION: Composite: Draws a white line from (420, 252) to (9, 101) then Places a red dot at position (466, 236).
; PLAN: r0=420(x1), r1=252(y1), r2=9(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=236(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 420
LDI r1, 252
LDI r2, 9
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 236
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
