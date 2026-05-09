; DESCRIPTION: Draws a blue line from (63, 210) to (38, 239).
; PLAN: r0=63(x1), r1=210(y1), r2=38(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 210
LDI r2, 38
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
