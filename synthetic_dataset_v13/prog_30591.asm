; DESCRIPTION: Draws a cyan line from (501, 241) to (190, 5).
; PLAN: r0=501(x1), r1=241(y1), r2=190(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 241
LDI r2, 190
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
