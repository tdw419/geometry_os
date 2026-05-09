; DESCRIPTION: Draws a black line from (345, 243) to (505, 251).
; PLAN: r0=345(x1), r1=243(y1), r2=505(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 243
LDI r2, 505
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
