; DESCRIPTION: Draws a cyan line from (363, 159) to (498, 81).
; PLAN: r0=363(x1), r1=159(y1), r2=498(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 159
LDI r2, 498
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
