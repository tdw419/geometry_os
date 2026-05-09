; DESCRIPTION: Composite: Draws a red line from (469, 43) to (400, 67) then Places a red dot at position (411, 39).
; PLAN: r0=469(x1), r1=43(y1), r2=400(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=39(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 469
LDI r1, 43
LDI r2, 400
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 39
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
