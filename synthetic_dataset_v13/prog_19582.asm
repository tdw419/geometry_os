; DESCRIPTION: Draws a blue line from (164, 217) to (103, 221).
; PLAN: r0=164(x1), r1=217(y1), r2=103(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 217
LDI r2, 103
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
