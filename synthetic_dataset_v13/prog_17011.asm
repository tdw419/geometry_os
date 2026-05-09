; DESCRIPTION: Draws a green line from (105, 16) to (208, 155).
; PLAN: r0=105(x1), r1=16(y1), r2=208(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 16
LDI r2, 208
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
