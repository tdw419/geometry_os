; DESCRIPTION: Draws a cyan line from (198, 89) to (349, 190).
; PLAN: r0=198(x1), r1=89(y1), r2=349(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 89
LDI r2, 349
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
