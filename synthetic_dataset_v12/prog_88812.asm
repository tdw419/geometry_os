; DESCRIPTION: Draws a magenta line from (309, 214) to (65, 197).
; PLAN: r0=309(x1), r1=214(y1), r2=65(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 214
LDI r2, 65
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
