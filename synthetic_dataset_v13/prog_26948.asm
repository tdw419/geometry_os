; DESCRIPTION: Composite: Draws a blue line from (52, 188) to (41, 121) then Places a yellow dot at position (267, 189).
; PLAN: r0=52(x1), r1=188(y1), r2=41(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=189(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 52
LDI r1, 188
LDI r2, 41
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 189
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
