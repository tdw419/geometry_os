; DESCRIPTION: Draws a blue line from (433, 120) to (368, 145).
; PLAN: r0=433(x1), r1=120(y1), r2=368(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 120
LDI r2, 368
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
