; DESCRIPTION: Draws a green line from (85, 6) to (190, 195).
; PLAN: r0=85(x1), r1=6(y1), r2=190(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 6
LDI r2, 190
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
