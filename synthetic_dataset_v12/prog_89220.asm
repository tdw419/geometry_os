; DESCRIPTION: Draws a cyan line from (451, 179) to (338, 177).
; PLAN: r0=451(x1), r1=179(y1), r2=338(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 179
LDI r2, 338
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
