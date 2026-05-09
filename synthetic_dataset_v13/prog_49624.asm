; DESCRIPTION: Draws a green line from (389, 117) to (253, 141).
; PLAN: r0=389(x1), r1=117(y1), r2=253(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 117
LDI r2, 253
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
