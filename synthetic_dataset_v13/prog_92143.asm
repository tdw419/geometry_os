; DESCRIPTION: Draws a green line from (153, 117) to (450, 85).
; PLAN: r0=153(x1), r1=117(y1), r2=450(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 117
LDI r2, 450
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
