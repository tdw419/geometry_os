; DESCRIPTION: Draws a cyan line from (438, 52) to (337, 190).
; PLAN: r0=438(x1), r1=52(y1), r2=337(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 52
LDI r2, 337
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
