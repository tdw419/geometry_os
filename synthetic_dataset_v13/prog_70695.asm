; DESCRIPTION: Places a green line segment connecting (421, 231) to (322, 19).
; PLAN: r0=421(x1), r1=231(y1), r2=322(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 231
LDI r2, 322
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
