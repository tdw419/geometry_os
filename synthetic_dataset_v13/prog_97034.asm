; DESCRIPTION: Places a yellow line segment connecting (202, 85) to (198, 18).
; PLAN: r0=202(x1), r1=85(y1), r2=198(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 85
LDI r2, 198
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
