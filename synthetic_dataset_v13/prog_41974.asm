; DESCRIPTION: Draws a orange line from (305, 165) to (358, 189).
; PLAN: r0=305(x1), r1=165(y1), r2=358(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 165
LDI r2, 358
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
