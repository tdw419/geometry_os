; DESCRIPTION: Draws a black line from (425, 243) to (331, 156).
; PLAN: r0=425(x1), r1=243(y1), r2=331(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 243
LDI r2, 331
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
