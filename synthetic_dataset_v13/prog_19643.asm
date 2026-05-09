; DESCRIPTION: Draws a yellow line from (400, 75) to (440, 70).
; PLAN: r0=400(x1), r1=75(y1), r2=440(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 75
LDI r2, 440
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
