; DESCRIPTION: Draws a blue line from (374, 175) to (460, 48).
; PLAN: r0=374(x1), r1=175(y1), r2=460(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 175
LDI r2, 460
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
