; DESCRIPTION: Draws a blue line from (206, 172) to (407, 243).
; PLAN: r0=206(x1), r1=172(y1), r2=407(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 172
LDI r2, 407
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
