; DESCRIPTION: Composite: Draws a blue line from (308, 140) to (128, 55) then Places a purple dot at position (272, 92).
; PLAN: r0=308(x1), r1=140(y1), r2=128(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=92(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 140
LDI r2, 128
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 92
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
