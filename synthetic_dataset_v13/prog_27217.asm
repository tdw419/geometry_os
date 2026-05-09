; DESCRIPTION: Renders a magenta line between points (449, 243) and (391, 110).
; PLAN: r0=449(x1), r1=243(y1), r2=391(x2), r3=110(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 243
LDI r2, 391
LDI r3, 110
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
