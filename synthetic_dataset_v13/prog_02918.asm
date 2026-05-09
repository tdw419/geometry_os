; DESCRIPTION: Draws a green line from (179, 63) to (457, 214).
; PLAN: r0=179(x1), r1=63(y1), r2=457(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 63
LDI r2, 457
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
