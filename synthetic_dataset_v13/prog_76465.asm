; DESCRIPTION: Places a yellow line segment connecting (505, 33) to (124, 171).
; PLAN: r0=505(x1), r1=33(y1), r2=124(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 33
LDI r2, 124
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
