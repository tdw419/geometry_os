; DESCRIPTION: Places a green line segment connecting (59, 169) to (207, 253).
; PLAN: r0=59(x1), r1=169(y1), r2=207(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 169
LDI r2, 207
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
