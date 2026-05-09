; DESCRIPTION: Renders a green line between points (60, 60) and (274, 209).
; PLAN: r0=60(x1), r1=60(y1), r2=274(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 60
LDI r2, 274
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
