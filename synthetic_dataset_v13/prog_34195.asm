; DESCRIPTION: Draws a white line from (339, 44) to (440, 147).
; PLAN: r0=339(x1), r1=44(y1), r2=440(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 44
LDI r2, 440
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
