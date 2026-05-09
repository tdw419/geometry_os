; DESCRIPTION: Places a yellow line segment connecting (509, 174) to (171, 33).
; PLAN: r0=509(x1), r1=174(y1), r2=171(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 174
LDI r2, 171
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
