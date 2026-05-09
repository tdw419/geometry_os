; DESCRIPTION: Draws a blue line from (459, 23) to (217, 134).
; PLAN: r0=459(x1), r1=23(y1), r2=217(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 23
LDI r2, 217
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
