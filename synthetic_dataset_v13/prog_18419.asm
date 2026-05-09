; DESCRIPTION: Draws a cyan line from (207, 11) to (145, 159).
; PLAN: r0=207(x1), r1=11(y1), r2=145(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 11
LDI r2, 145
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
