; DESCRIPTION: Draws a red line from (154, 219) to (7, 191).
; PLAN: r0=154(x1), r1=219(y1), r2=7(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 219
LDI r2, 7
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
