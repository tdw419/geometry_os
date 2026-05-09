; DESCRIPTION: Draws a blue line from (429, 85) to (209, 178).
; PLAN: r0=429(x1), r1=85(y1), r2=209(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 85
LDI r2, 209
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
