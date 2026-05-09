; DESCRIPTION: Draws a red line from (421, 119) to (247, 168).
; PLAN: r0=421(x1), r1=119(y1), r2=247(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 119
LDI r2, 247
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
