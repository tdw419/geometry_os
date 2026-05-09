; DESCRIPTION: Composite: Draws a green line from (121, 21) to (68, 89) then Places a magenta dot at position (315, 150).
; PLAN: r0=121(x1), r1=21(y1), r2=68(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=150(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 21
LDI r2, 68
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 150
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
