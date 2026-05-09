; DESCRIPTION: Draws a green line from (52, 122) to (248, 218).
; PLAN: r0=52(x1), r1=122(y1), r2=248(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 122
LDI r2, 248
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
