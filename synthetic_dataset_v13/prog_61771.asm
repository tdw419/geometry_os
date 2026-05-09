; DESCRIPTION: Places a yellow line segment connecting (275, 124) to (127, 96).
; PLAN: r0=275(x1), r1=124(y1), r2=127(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 124
LDI r2, 127
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
