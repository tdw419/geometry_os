; DESCRIPTION: Composite: Draws a blue line from (308, 63) to (39, 10) then Places a black dot at position (213, 75).
; PLAN: r0=308(x1), r1=63(y1), r2=39(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=75(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 63
LDI r2, 39
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 75
LDI r7, 0x000000
PSET r5, r6, r7
HALT
