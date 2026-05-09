; DESCRIPTION: Draws a blue line from (49, 124) to (177, 233).
; PLAN: r0=49(x1), r1=124(y1), r2=177(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 124
LDI r2, 177
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
