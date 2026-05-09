; DESCRIPTION: Draws a black line from (487, 10) to (366, 251).
; PLAN: r0=487(x1), r1=10(y1), r2=366(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 10
LDI r2, 366
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
