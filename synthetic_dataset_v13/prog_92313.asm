; DESCRIPTION: Places a black line segment connecting (440, 127) to (428, 46).
; PLAN: r0=440(x1), r1=127(y1), r2=428(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 127
LDI r2, 428
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
