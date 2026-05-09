; DESCRIPTION: Draws a black line from (202, 94) to (365, 155).
; PLAN: r0=202(x1), r1=94(y1), r2=365(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 94
LDI r2, 365
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
