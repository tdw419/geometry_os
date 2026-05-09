; DESCRIPTION: Renders a red line between points (123, 181) and (176, 22).
; PLAN: r0=123(x1), r1=181(y1), r2=176(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 181
LDI r2, 176
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
