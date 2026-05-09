; DESCRIPTION: Draws a blue line from (210, 250) to (140, 134).
; PLAN: r0=210(x1), r1=250(y1), r2=140(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 250
LDI r2, 140
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
