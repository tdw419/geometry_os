; DESCRIPTION: Draws a green line from (409, 94) to (330, 15).
; PLAN: r0=409(x1), r1=94(y1), r2=330(x2), r3=15(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 94
LDI r2, 330
LDI r3, 15
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
