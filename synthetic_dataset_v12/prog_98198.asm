; DESCRIPTION: Renders a green line between points (315, 15) and (371, 58).
; PLAN: r0=315(x1), r1=15(y1), r2=371(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 15
LDI r2, 371
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
