; DESCRIPTION: Draws a blue line from (50, 17) to (487, 136).
; PLAN: r0=50(x1), r1=17(y1), r2=487(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 17
LDI r2, 487
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
