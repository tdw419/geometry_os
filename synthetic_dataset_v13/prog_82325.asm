; DESCRIPTION: Draws a cyan line from (11, 18) to (489, 155).
; PLAN: r0=11(x1), r1=18(y1), r2=489(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 18
LDI r2, 489
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
