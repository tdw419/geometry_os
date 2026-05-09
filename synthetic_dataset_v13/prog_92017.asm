; DESCRIPTION: Draws a orange line from (304, 121) to (440, 95).
; PLAN: r0=304(x1), r1=121(y1), r2=440(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 121
LDI r2, 440
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
