; DESCRIPTION: Draws a orange line from (254, 249) to (371, 33).
; PLAN: r0=254(x1), r1=249(y1), r2=371(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 249
LDI r2, 371
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
