; DESCRIPTION: Draws a green line from (44, 97) to (177, 94).
; PLAN: r0=44(x1), r1=97(y1), r2=177(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 97
LDI r2, 177
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
