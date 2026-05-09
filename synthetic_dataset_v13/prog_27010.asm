; DESCRIPTION: Places a yellow line segment connecting (470, 47) to (138, 103).
; PLAN: r0=470(x1), r1=47(y1), r2=138(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 47
LDI r2, 138
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
