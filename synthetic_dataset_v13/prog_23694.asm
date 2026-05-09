; DESCRIPTION: Draws a black line from (393, 86) to (396, 115).
; PLAN: r0=393(x1), r1=86(y1), r2=396(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 86
LDI r2, 396
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
