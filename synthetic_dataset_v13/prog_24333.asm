; DESCRIPTION: Places a yellow line segment connecting (322, 184) to (329, 197).
; PLAN: r0=322(x1), r1=184(y1), r2=329(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 184
LDI r2, 329
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
