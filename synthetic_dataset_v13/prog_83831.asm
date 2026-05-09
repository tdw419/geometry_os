; DESCRIPTION: Draws a blue line from (309, 209) to (143, 206).
; PLAN: r0=309(x1), r1=209(y1), r2=143(x2), r3=206(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 209
LDI r2, 143
LDI r3, 206
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
