; DESCRIPTION: Places a red line segment connecting (440, 7) to (196, 70).
; PLAN: r0=440(x1), r1=7(y1), r2=196(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 7
LDI r2, 196
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
