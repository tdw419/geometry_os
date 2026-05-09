; DESCRIPTION: Draws a orange line from (328, 113) to (146, 184).
; PLAN: r0=328(x1), r1=113(y1), r2=146(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 113
LDI r2, 146
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
