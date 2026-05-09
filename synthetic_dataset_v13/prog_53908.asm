; DESCRIPTION: Renders a purple line between points (502, 76) and (496, 236).
; PLAN: r0=502(x1), r1=76(y1), r2=496(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 76
LDI r2, 496
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
