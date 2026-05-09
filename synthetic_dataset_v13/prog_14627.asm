; DESCRIPTION: Composite: Renders a blue line between points (451, 68) and (63, 164) then Places a green dot at position (74, 66).
; PLAN: r0=451(x1), r1=68(y1), r2=63(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=66(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 451
LDI r1, 68
LDI r2, 63
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 66
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
