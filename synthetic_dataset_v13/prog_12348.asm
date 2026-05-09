; DESCRIPTION: Draws a yellow line from (178, 159) to (442, 85).
; PLAN: r0=178(x1), r1=159(y1), r2=442(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 159
LDI r2, 442
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
