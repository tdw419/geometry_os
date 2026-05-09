; DESCRIPTION: Draws a blue line from (65, 209) to (234, 184).
; PLAN: r0=65(x1), r1=209(y1), r2=234(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 209
LDI r2, 234
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
