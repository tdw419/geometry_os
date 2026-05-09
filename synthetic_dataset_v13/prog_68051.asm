; DESCRIPTION: Draws a cyan line from (323, 119) to (3, 173).
; PLAN: r0=323(x1), r1=119(y1), r2=3(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 119
LDI r2, 3
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
