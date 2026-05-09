; DESCRIPTION: Draws a blue line from (188, 18) to (178, 234).
; PLAN: r0=188(x1), r1=18(y1), r2=178(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 18
LDI r2, 178
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
