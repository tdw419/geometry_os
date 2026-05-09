; DESCRIPTION: Draws a green line from (106, 237) to (489, 20).
; PLAN: r0=106(x1), r1=237(y1), r2=489(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 237
LDI r2, 489
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
