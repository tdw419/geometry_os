; DESCRIPTION: Places a white line segment connecting (36, 16) to (431, 210).
; PLAN: r0=36(x1), r1=16(y1), r2=431(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 16
LDI r2, 431
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
