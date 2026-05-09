; DESCRIPTION: Draws a green line from (253, 247) to (149, 83).
; PLAN: r0=253(x1), r1=247(y1), r2=149(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 247
LDI r2, 149
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
