; DESCRIPTION: Places a yellow line segment connecting (440, 146) to (306, 229).
; PLAN: r0=440(x1), r1=146(y1), r2=306(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 146
LDI r2, 306
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
