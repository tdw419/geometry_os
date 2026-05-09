; DESCRIPTION: Draws a white line from (440, 155) to (8, 16).
; PLAN: r0=440(x1), r1=155(y1), r2=8(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 155
LDI r2, 8
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
