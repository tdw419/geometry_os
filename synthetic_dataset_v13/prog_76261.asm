; DESCRIPTION: Draws a red line from (169, 149) to (406, 42).
; PLAN: r0=169(x1), r1=149(y1), r2=406(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 149
LDI r2, 406
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
