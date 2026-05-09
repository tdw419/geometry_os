; DESCRIPTION: Draws a blue line from (356, 65) to (123, 223).
; PLAN: r0=356(x1), r1=65(y1), r2=123(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 65
LDI r2, 123
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
