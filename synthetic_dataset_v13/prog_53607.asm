; DESCRIPTION: Draws a red line from (505, 152) to (169, 42).
; PLAN: r0=505(x1), r1=152(y1), r2=169(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 152
LDI r2, 169
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
