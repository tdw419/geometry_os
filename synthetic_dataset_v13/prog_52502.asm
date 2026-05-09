; DESCRIPTION: Places a green line segment connecting (431, 168) to (144, 169).
; PLAN: r0=431(x1), r1=168(y1), r2=144(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 168
LDI r2, 144
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
