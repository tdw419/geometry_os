; DESCRIPTION: Draws a blue line from (211, 9) to (52, 91).
; PLAN: r0=211(x1), r1=9(y1), r2=52(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 9
LDI r2, 52
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
