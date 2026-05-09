; DESCRIPTION: Draws a green line from (99, 51) to (234, 159).
; PLAN: r0=99(x1), r1=51(y1), r2=234(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 51
LDI r2, 234
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
