; DESCRIPTION: Composite: Draws a blue line from (100, 1) to (338, 8) then Places a white dot at position (82, 225).
; PLAN: r0=100(x1), r1=1(y1), r2=338(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=225(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 1
LDI r2, 338
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 225
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
