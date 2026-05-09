; DESCRIPTION: Renders a white line between points (274, 134) and (135, 243).
; PLAN: r0=274(x1), r1=134(y1), r2=135(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 134
LDI r2, 135
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
