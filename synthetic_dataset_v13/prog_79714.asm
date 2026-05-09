; DESCRIPTION: Draws a white line from (459, 44) to (170, 48).
; PLAN: r0=459(x1), r1=44(y1), r2=170(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 44
LDI r2, 170
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
