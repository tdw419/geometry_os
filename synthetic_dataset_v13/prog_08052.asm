; DESCRIPTION: Draws a blue line from (103, 193) to (29, 144).
; PLAN: r0=103(x1), r1=193(y1), r2=29(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 193
LDI r2, 29
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
