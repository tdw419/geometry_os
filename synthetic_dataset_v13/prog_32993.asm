; DESCRIPTION: Places a green line segment connecting (440, 90) to (110, 146).
; PLAN: r0=440(x1), r1=90(y1), r2=110(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 90
LDI r2, 110
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
