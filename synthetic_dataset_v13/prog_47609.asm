; DESCRIPTION: Draws a green line from (164, 122) to (363, 141).
; PLAN: r0=164(x1), r1=122(y1), r2=363(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 122
LDI r2, 363
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
