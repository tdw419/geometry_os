; DESCRIPTION: Draws a yellow line from (322, 12) to (501, 210).
; PLAN: r0=322(x1), r1=12(y1), r2=501(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 12
LDI r2, 501
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
