; DESCRIPTION: Renders a green line between points (5, 204) and (13, 210).
; PLAN: r0=5(x1), r1=204(y1), r2=13(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 204
LDI r2, 13
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
