; DESCRIPTION: Draws a red line from (282, 63) to (80, 120).
; PLAN: r0=282(x1), r1=63(y1), r2=80(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 63
LDI r2, 80
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
