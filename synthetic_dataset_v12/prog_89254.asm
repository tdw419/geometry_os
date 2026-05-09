; DESCRIPTION: Places a green line segment connecting (160, 151) to (322, 71).
; PLAN: r0=160(x1), r1=151(y1), r2=322(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 151
LDI r2, 322
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
