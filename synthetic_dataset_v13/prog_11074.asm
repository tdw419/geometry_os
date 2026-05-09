; DESCRIPTION: Draws a black line from (23, 151) to (66, 79).
; PLAN: r0=23(x1), r1=151(y1), r2=66(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 151
LDI r2, 66
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
