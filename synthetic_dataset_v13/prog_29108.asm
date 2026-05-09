; DESCRIPTION: Draws a yellow line from (23, 159) to (110, 142).
; PLAN: r0=23(x1), r1=159(y1), r2=110(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 159
LDI r2, 110
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
