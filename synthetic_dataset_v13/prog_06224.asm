; DESCRIPTION: Draws a purple line from (243, 223) to (236, 233).
; PLAN: r0=243(x1), r1=223(y1), r2=236(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 223
LDI r2, 236
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
