; DESCRIPTION: Draws a orange line from (305, 113) to (74, 146).
; PLAN: r0=305(x1), r1=113(y1), r2=74(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 113
LDI r2, 74
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
