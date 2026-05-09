; DESCRIPTION: Draws a orange line from (206, 223) to (222, 32).
; PLAN: r0=206(x1), r1=223(y1), r2=222(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 223
LDI r2, 222
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
