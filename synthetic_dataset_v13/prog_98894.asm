; DESCRIPTION: Draws a green line from (153, 190) to (76, 63).
; PLAN: r0=153(x1), r1=190(y1), r2=76(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 190
LDI r2, 76
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
