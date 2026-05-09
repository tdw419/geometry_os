; DESCRIPTION: Renders a red line between points (312, 59) and (101, 231).
; PLAN: r0=312(x1), r1=59(y1), r2=101(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 59
LDI r2, 101
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
