; DESCRIPTION: Renders a white line between points (68, 220) and (274, 87).
; PLAN: r0=68(x1), r1=220(y1), r2=274(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 220
LDI r2, 274
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
