; DESCRIPTION: Composite: Draws a cyan line from (185, 50) to (476, 17) then Places a cyan dot at position (161, 2).
; PLAN: r0=185(x1), r1=50(y1), r2=476(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=2(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 50
LDI r2, 476
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 2
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
