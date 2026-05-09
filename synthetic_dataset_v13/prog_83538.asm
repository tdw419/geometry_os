; DESCRIPTION: Draws a orange line from (440, 190) to (328, 244).
; PLAN: r0=440(x1), r1=190(y1), r2=328(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 190
LDI r2, 328
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
