; DESCRIPTION: Draws a green line from (149, 209) to (471, 87).
; PLAN: r0=149(x1), r1=209(y1), r2=471(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 209
LDI r2, 471
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
