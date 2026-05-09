; DESCRIPTION: Composite: Renders a blue line between points (79, 197) and (156, 148) then Places a green dot at position (167, 122).
; PLAN: r0=79(x1), r1=197(y1), r2=156(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=122(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 79
LDI r1, 197
LDI r2, 156
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 122
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
