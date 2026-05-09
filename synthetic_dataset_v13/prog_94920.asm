; DESCRIPTION: Renders a green line between points (422, 96) and (166, 48).
; PLAN: r0=422(x1), r1=96(y1), r2=166(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 96
LDI r2, 166
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
