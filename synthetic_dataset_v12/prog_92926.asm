; DESCRIPTION: Draws a orange line from (305, 171) to (262, 212).
; PLAN: r0=305(x1), r1=171(y1), r2=262(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 171
LDI r2, 262
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
