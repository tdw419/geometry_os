; DESCRIPTION: Draws a blue line from (339, 106) to (225, 186).
; PLAN: r0=339(x1), r1=106(y1), r2=225(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 106
LDI r2, 225
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
