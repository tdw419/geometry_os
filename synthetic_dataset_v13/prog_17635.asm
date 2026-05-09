; DESCRIPTION: Draws a blue line from (345, 207) to (225, 52).
; PLAN: r0=345(x1), r1=207(y1), r2=225(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 207
LDI r2, 225
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
