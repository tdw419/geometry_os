; DESCRIPTION: Draws a orange line from (118, 158) to (242, 179).
; PLAN: r0=118(x1), r1=158(y1), r2=242(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 158
LDI r2, 242
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
