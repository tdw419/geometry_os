; DESCRIPTION: Draws a cyan line from (232, 195) to (145, 85).
; PLAN: r0=232(x1), r1=195(y1), r2=145(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 195
LDI r2, 145
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
