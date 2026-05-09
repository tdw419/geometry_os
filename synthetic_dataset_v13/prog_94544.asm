; DESCRIPTION: Draws a red line from (152, 190) to (160, 179).
; PLAN: r0=152(x1), r1=190(y1), r2=160(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 190
LDI r2, 160
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
