; DESCRIPTION: Draws a black line from (451, 225) to (228, 97).
; PLAN: r0=451(x1), r1=225(y1), r2=228(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 225
LDI r2, 228
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
