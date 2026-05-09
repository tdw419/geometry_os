; DESCRIPTION: Draws a orange line from (327, 95) to (146, 59).
; PLAN: r0=327(x1), r1=95(y1), r2=146(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 95
LDI r2, 146
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
