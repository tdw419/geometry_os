; DESCRIPTION: Draws a green line from (154, 137) to (428, 9).
; PLAN: r0=154(x1), r1=137(y1), r2=428(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 137
LDI r2, 428
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
