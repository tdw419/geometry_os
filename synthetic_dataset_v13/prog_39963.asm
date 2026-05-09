; DESCRIPTION: Places a yellow line segment connecting (167, 78) to (331, 146).
; PLAN: r0=167(x1), r1=78(y1), r2=331(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 78
LDI r2, 331
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
