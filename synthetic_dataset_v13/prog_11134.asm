; DESCRIPTION: Draws a blue line from (206, 68) to (506, 172).
; PLAN: r0=206(x1), r1=68(y1), r2=506(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 68
LDI r2, 506
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
