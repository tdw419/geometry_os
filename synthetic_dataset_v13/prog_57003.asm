; DESCRIPTION: Draws a white line from (18, 17) to (66, 251).
; PLAN: r0=18(x1), r1=17(y1), r2=66(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 17
LDI r2, 66
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
