; DESCRIPTION: Composite: Draws a red line from (349, 206) to (153, 91) then Places a blue dot at position (45, 61).
; PLAN: r0=349(x1), r1=206(y1), r2=153(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=61(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 349
LDI r1, 206
LDI r2, 153
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 61
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
