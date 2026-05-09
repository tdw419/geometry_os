; DESCRIPTION: Places a white line segment connecting (337, 46) to (489, 91).
; PLAN: r0=337(x1), r1=46(y1), r2=489(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 46
LDI r2, 489
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
