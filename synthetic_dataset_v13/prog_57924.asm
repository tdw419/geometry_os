; DESCRIPTION: Draws a white line from (101, 189) to (114, 193).
; PLAN: r0=101(x1), r1=189(y1), r2=114(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 189
LDI r2, 114
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
