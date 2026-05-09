; DESCRIPTION: Draws a green line from (402, 193) to (258, 153).
; PLAN: r0=402(x1), r1=193(y1), r2=258(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 193
LDI r2, 258
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
