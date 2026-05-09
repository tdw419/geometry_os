; DESCRIPTION: Places a yellow line segment connecting (392, 200) to (172, 98).
; PLAN: r0=392(x1), r1=200(y1), r2=172(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 200
LDI r2, 172
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
