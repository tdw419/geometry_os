; DESCRIPTION: Renders a blue line between points (421, 253) and (193, 204).
; PLAN: r0=421(x1), r1=253(y1), r2=193(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 253
LDI r2, 193
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
