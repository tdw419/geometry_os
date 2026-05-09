; DESCRIPTION: Draws a red line from (135, 139) to (128, 169).
; PLAN: r0=135(x1), r1=139(y1), r2=128(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 139
LDI r2, 128
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
