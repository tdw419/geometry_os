; DESCRIPTION: Draws a cyan line from (190, 175) to (43, 185).
; PLAN: r0=190(x1), r1=175(y1), r2=43(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 175
LDI r2, 43
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
