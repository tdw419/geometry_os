; DESCRIPTION: Draws a cyan line from (94, 119) to (249, 246).
; PLAN: r0=94(x1), r1=119(y1), r2=249(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 119
LDI r2, 249
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
