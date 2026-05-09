; DESCRIPTION: Draws a black line from (300, 61) to (270, 193).
; PLAN: r0=300(x1), r1=61(y1), r2=270(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 61
LDI r2, 270
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
