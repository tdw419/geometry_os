; DESCRIPTION: Draws a blue line from (206, 164) to (486, 91).
; PLAN: r0=206(x1), r1=164(y1), r2=486(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 164
LDI r2, 486
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
