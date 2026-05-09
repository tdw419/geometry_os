; DESCRIPTION: Draws a green line from (122, 204) to (389, 46).
; PLAN: r0=122(x1), r1=204(y1), r2=389(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 204
LDI r2, 389
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
