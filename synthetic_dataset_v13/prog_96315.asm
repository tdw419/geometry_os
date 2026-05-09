; DESCRIPTION: Draws a red line from (334, 247) to (134, 193).
; PLAN: r0=334(x1), r1=247(y1), r2=134(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 247
LDI r2, 134
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
