; DESCRIPTION: Draws a orange line from (36, 139) to (464, 210).
; PLAN: r0=36(x1), r1=139(y1), r2=464(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 139
LDI r2, 464
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
