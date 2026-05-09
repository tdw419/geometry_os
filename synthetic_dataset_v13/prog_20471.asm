; DESCRIPTION: Draws a red line from (139, 68) to (84, 6).
; PLAN: r0=139(x1), r1=68(y1), r2=84(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 68
LDI r2, 84
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
