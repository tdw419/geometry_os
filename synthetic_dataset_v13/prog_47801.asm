; DESCRIPTION: Places a green line segment connecting (424, 164) to (428, 28).
; PLAN: r0=424(x1), r1=164(y1), r2=428(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 164
LDI r2, 428
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
