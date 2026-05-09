; DESCRIPTION: Composite: Places a blue line segment connecting (347, 50) to (207, 133) then Places a red dot at position (454, 101).
; PLAN: r0=347(x1), r1=50(y1), r2=207(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=101(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 347
LDI r1, 50
LDI r2, 207
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 101
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
