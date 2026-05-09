; DESCRIPTION: Places a white line segment connecting (230, 97) to (344, 127).
; PLAN: r0=230(x1), r1=97(y1), r2=344(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 97
LDI r2, 344
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
