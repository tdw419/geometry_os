; DESCRIPTION: Draws a orange line from (277, 105) to (271, 215).
; PLAN: r0=277(x1), r1=105(y1), r2=271(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 105
LDI r2, 271
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
