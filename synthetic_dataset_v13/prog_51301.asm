; DESCRIPTION: Draws a green line from (130, 95) to (188, 4).
; PLAN: r0=130(x1), r1=95(y1), r2=188(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 95
LDI r2, 188
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
