; DESCRIPTION: Draws a green line from (321, 124) to (253, 183).
; PLAN: r0=321(x1), r1=124(y1), r2=253(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 124
LDI r2, 253
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
