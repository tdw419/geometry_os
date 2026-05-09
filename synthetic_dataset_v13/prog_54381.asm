; DESCRIPTION: Draws a orange line from (255, 113) to (32, 233).
; PLAN: r0=255(x1), r1=113(y1), r2=32(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 113
LDI r2, 32
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
