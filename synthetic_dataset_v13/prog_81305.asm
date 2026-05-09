; DESCRIPTION: Draws a blue line from (309, 149) to (510, 204).
; PLAN: r0=309(x1), r1=149(y1), r2=510(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 149
LDI r2, 510
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
