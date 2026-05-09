; DESCRIPTION: Draws a red line from (101, 56) to (193, 226).
; PLAN: r0=101(x1), r1=56(y1), r2=193(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 56
LDI r2, 193
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
