; DESCRIPTION: Draws a red line from (234, 64) to (473, 47).
; PLAN: r0=234(x1), r1=64(y1), r2=473(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 64
LDI r2, 473
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
