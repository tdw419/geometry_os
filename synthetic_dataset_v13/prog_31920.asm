; DESCRIPTION: Draws a blue line from (309, 138) to (505, 32).
; PLAN: r0=309(x1), r1=138(y1), r2=505(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 138
LDI r2, 505
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
