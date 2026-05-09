; DESCRIPTION: Draws a green line from (247, 204) to (274, 233).
; PLAN: r0=247(x1), r1=204(y1), r2=274(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 204
LDI r2, 274
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
