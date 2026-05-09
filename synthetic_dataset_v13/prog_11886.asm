; DESCRIPTION: Draws a green line from (143, 102) to (247, 136).
; PLAN: r0=143(x1), r1=102(y1), r2=247(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 102
LDI r2, 247
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
