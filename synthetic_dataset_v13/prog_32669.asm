; DESCRIPTION: Draws a red line from (23, 38) to (57, 165).
; PLAN: r0=23(x1), r1=38(y1), r2=57(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 38
LDI r2, 57
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
