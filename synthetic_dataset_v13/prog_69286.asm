; DESCRIPTION: Draws a green line from (322, 46) to (501, 159).
; PLAN: r0=322(x1), r1=46(y1), r2=501(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 46
LDI r2, 501
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
