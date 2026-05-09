; DESCRIPTION: Draws a magenta line from (137, 195) to (40, 254).
; PLAN: r0=137(x1), r1=195(y1), r2=40(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 195
LDI r2, 40
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
