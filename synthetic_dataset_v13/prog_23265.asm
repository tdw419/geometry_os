; DESCRIPTION: Draws a blue line from (393, 14) to (106, 172).
; PLAN: r0=393(x1), r1=14(y1), r2=106(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 14
LDI r2, 106
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
