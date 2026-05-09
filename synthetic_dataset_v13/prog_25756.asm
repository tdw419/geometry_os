; DESCRIPTION: Draws a green line from (140, 253) to (509, 136).
; PLAN: r0=140(x1), r1=253(y1), r2=509(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 253
LDI r2, 509
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
