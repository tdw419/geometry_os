; DESCRIPTION: Draws a cyan line from (261, 63) to (343, 110).
; PLAN: r0=261(x1), r1=63(y1), r2=343(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 63
LDI r2, 343
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
