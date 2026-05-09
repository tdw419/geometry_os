; DESCRIPTION: Places a blue line segment connecting (344, 97) to (502, 3).
; PLAN: r0=344(x1), r1=97(y1), r2=502(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 97
LDI r2, 502
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
