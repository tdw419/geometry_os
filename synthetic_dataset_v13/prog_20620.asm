; DESCRIPTION: Draws a magenta line from (139, 45) to (197, 105).
; PLAN: r0=139(x1), r1=45(y1), r2=197(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 45
LDI r2, 197
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
