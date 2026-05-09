; DESCRIPTION: Draws a cyan line from (1, 161) to (81, 190).
; PLAN: r0=1(x1), r1=161(y1), r2=81(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 161
LDI r2, 81
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
