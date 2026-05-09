; DESCRIPTION: Draws a blue line from (464, 112) to (319, 172).
; PLAN: r0=464(x1), r1=112(y1), r2=319(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 112
LDI r2, 319
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
