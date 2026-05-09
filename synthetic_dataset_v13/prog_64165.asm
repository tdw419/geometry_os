; DESCRIPTION: Draws a cyan line from (470, 100) to (158, 79).
; PLAN: r0=470(x1), r1=100(y1), r2=158(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 100
LDI r2, 158
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
