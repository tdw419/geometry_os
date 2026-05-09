; DESCRIPTION: Draws a blue line from (464, 17) to (487, 8).
; PLAN: r0=464(x1), r1=17(y1), r2=487(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 17
LDI r2, 487
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
