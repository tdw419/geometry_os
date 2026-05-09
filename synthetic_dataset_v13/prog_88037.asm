; DESCRIPTION: Draws a magenta line from (298, 34) to (159, 206).
; PLAN: r0=298(x1), r1=34(y1), r2=159(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 34
LDI r2, 159
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
