; DESCRIPTION: Draws a blue line from (459, 60) to (66, 52).
; PLAN: r0=459(x1), r1=60(y1), r2=66(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 60
LDI r2, 66
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
