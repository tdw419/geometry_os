; DESCRIPTION: Draws a black line from (427, 32) to (435, 180).
; PLAN: r0=427(x1), r1=32(y1), r2=435(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 32
LDI r2, 435
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
