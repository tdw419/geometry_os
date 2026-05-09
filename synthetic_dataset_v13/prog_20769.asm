; DESCRIPTION: Draws a green line from (402, 162) to (428, 241).
; PLAN: r0=402(x1), r1=162(y1), r2=428(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 162
LDI r2, 428
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
