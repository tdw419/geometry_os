; DESCRIPTION: Draws a cyan line from (471, 249) to (100, 66).
; PLAN: r0=471(x1), r1=249(y1), r2=100(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 249
LDI r2, 100
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
