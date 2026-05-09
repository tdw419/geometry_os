; DESCRIPTION: Draws a red line from (139, 33) to (6, 255).
; PLAN: r0=139(x1), r1=33(y1), r2=6(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 33
LDI r2, 6
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
