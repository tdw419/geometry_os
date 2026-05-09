; DESCRIPTION: Draws a purple line from (32, 22) to (342, 48).
; PLAN: r0=32(x1), r1=22(y1), r2=342(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 22
LDI r2, 342
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
