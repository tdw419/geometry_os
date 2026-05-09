; DESCRIPTION: Draws a cyan line from (205, 190) to (314, 218).
; PLAN: r0=205(x1), r1=190(y1), r2=314(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 190
LDI r2, 314
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
