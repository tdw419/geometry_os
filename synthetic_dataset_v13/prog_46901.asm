; DESCRIPTION: Draws a red line from (491, 12) to (440, 141).
; PLAN: r0=491(x1), r1=12(y1), r2=440(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 12
LDI r2, 440
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
