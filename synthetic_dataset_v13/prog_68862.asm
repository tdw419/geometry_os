; DESCRIPTION: Draws a yellow line from (170, 87) to (428, 164).
; PLAN: r0=170(x1), r1=87(y1), r2=428(x2), r3=164(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 87
LDI r2, 428
LDI r3, 164
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
