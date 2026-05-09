; DESCRIPTION: Draws a cyan line from (8, 185) to (159, 145).
; PLAN: r0=8(x1), r1=185(y1), r2=159(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 185
LDI r2, 159
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
