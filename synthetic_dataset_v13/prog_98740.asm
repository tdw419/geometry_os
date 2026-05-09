; DESCRIPTION: Draws a magenta line from (449, 197) to (442, 121).
; PLAN: r0=449(x1), r1=197(y1), r2=442(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 197
LDI r2, 442
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
