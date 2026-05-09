; DESCRIPTION: Draws a cyan line from (335, 155) to (162, 8).
; PLAN: r0=335(x1), r1=155(y1), r2=162(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 155
LDI r2, 162
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
