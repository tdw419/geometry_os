; DESCRIPTION: Places a green line segment connecting (382, 17) to (301, 46).
; PLAN: r0=382(x1), r1=17(y1), r2=301(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 17
LDI r2, 301
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
