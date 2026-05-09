; DESCRIPTION: Draws a blue line from (159, 152) to (294, 212).
; PLAN: r0=159(x1), r1=152(y1), r2=294(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 152
LDI r2, 294
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
