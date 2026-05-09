; DESCRIPTION: Draws a black line from (486, 243) to (32, 157).
; PLAN: r0=486(x1), r1=243(y1), r2=32(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 243
LDI r2, 32
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
