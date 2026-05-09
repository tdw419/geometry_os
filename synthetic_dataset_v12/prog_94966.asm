; DESCRIPTION: Draws a blue line from (356, 66) to (374, 226).
; PLAN: r0=356(x1), r1=66(y1), r2=374(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 66
LDI r2, 374
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
