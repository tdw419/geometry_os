; DESCRIPTION: Draws a green line from (77, 205) to (349, 74).
; PLAN: r0=77(x1), r1=205(y1), r2=349(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 205
LDI r2, 349
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
