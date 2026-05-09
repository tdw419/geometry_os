; DESCRIPTION: Composite: Renders a magenta line between points (217, 134) and (113, 250) then Places a yellow dot at position (139, 198).
; PLAN: r0=217(x1), r1=134(y1), r2=113(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=198(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 134
LDI r2, 113
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 198
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
