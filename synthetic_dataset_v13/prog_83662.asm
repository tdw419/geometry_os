; DESCRIPTION: Places a white line segment connecting (223, 24) to (243, 99).
; PLAN: r0=223(x1), r1=24(y1), r2=243(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 24
LDI r2, 243
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
