; DESCRIPTION: Draws a blue line from (115, 50) to (293, 138).
; PLAN: r0=115(x1), r1=50(y1), r2=293(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 50
LDI r2, 293
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
