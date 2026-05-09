; DESCRIPTION: Draws a cyan line from (388, 190) to (81, 122).
; PLAN: r0=388(x1), r1=190(y1), r2=81(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 190
LDI r2, 81
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
