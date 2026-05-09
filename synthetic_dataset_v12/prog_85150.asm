; DESCRIPTION: Places a white line segment connecting (344, 132) to (222, 164).
; PLAN: r0=344(x1), r1=132(y1), r2=222(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 132
LDI r2, 222
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
