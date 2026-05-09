; DESCRIPTION: Draws a orange line from (371, 247) to (464, 38).
; PLAN: r0=371(x1), r1=247(y1), r2=464(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 247
LDI r2, 464
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
