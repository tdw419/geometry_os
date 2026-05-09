; DESCRIPTION: Places a yellow line segment connecting (387, 250) to (303, 18).
; PLAN: r0=387(x1), r1=250(y1), r2=303(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 250
LDI r2, 303
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
