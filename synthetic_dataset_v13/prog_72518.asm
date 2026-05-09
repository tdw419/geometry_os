; DESCRIPTION: Draws a blue line from (94, 207) to (269, 91).
; PLAN: r0=94(x1), r1=207(y1), r2=269(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 207
LDI r2, 269
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
