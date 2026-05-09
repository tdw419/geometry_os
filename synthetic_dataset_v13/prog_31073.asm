; DESCRIPTION: Draws a green line from (56, 243) to (83, 138).
; PLAN: r0=56(x1), r1=243(y1), r2=83(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 243
LDI r2, 83
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
