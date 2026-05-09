; DESCRIPTION: Renders a green line between points (140, 253) and (436, 60).
; PLAN: r0=140(x1), r1=253(y1), r2=436(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 253
LDI r2, 436
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
