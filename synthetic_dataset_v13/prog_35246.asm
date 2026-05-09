; DESCRIPTION: Places a green line segment connecting (315, 152) to (91, 223).
; PLAN: r0=315(x1), r1=152(y1), r2=91(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 152
LDI r2, 91
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
