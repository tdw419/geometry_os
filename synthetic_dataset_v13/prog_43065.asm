; DESCRIPTION: Draws a blue line from (361, 162) to (459, 239).
; PLAN: r0=361(x1), r1=162(y1), r2=459(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 162
LDI r2, 459
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
