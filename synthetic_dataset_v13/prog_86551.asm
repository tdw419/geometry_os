; DESCRIPTION: Draws a red line from (150, 219) to (115, 59).
; PLAN: r0=150(x1), r1=219(y1), r2=115(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 219
LDI r2, 115
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
