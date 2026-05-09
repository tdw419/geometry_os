; DESCRIPTION: Renders a green line between points (204, 18) and (321, 103).
; PLAN: r0=204(x1), r1=18(y1), r2=321(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 18
LDI r2, 321
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
