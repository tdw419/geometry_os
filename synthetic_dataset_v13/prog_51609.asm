; DESCRIPTION: Draws a red line from (61, 214) to (450, 123).
; PLAN: r0=61(x1), r1=214(y1), r2=450(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 214
LDI r2, 450
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
