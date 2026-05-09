; DESCRIPTION: Draws a red line from (440, 9) to (22, 5).
; PLAN: r0=440(x1), r1=9(y1), r2=22(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 9
LDI r2, 22
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
