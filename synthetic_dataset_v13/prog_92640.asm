; DESCRIPTION: Draws a green line from (105, 22) to (450, 205).
; PLAN: r0=105(x1), r1=22(y1), r2=450(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 22
LDI r2, 450
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
