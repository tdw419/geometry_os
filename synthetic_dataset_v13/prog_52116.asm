; DESCRIPTION: Draws a red line from (123, 143) to (48, 78).
; PLAN: r0=123(x1), r1=143(y1), r2=48(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 143
LDI r2, 48
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
