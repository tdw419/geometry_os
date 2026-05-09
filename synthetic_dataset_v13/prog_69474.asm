; DESCRIPTION: Draws a black line from (345, 220) to (424, 99).
; PLAN: r0=345(x1), r1=220(y1), r2=424(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 220
LDI r2, 424
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
