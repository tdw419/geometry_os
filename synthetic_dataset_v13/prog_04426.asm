; DESCRIPTION: Draws a green line from (77, 153) to (105, 247).
; PLAN: r0=77(x1), r1=153(y1), r2=105(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 153
LDI r2, 105
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
