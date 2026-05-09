; DESCRIPTION: Draws a yellow line from (66, 151) to (83, 178).
; PLAN: r0=66(x1), r1=151(y1), r2=83(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 151
LDI r2, 83
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
