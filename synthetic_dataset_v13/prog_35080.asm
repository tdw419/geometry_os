; DESCRIPTION: Draws a black line from (57, 243) to (247, 245).
; PLAN: r0=57(x1), r1=243(y1), r2=247(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 243
LDI r2, 247
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
