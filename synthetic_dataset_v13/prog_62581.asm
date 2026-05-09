; DESCRIPTION: Draws a cyan line from (484, 89) to (418, 121).
; PLAN: r0=484(x1), r1=89(y1), r2=418(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 89
LDI r2, 418
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
