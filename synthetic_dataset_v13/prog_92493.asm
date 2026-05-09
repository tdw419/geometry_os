; DESCRIPTION: Draws a green line from (475, 247) to (93, 73).
; PLAN: r0=475(x1), r1=247(y1), r2=93(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 247
LDI r2, 93
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
