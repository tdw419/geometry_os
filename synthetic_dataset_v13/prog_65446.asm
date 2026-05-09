; DESCRIPTION: Draws a blue line from (108, 204) to (464, 62).
; PLAN: r0=108(x1), r1=204(y1), r2=464(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 204
LDI r2, 464
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
