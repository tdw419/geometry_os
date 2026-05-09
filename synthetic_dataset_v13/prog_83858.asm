; DESCRIPTION: Renders a white line between points (213, 124) and (184, 109).
; PLAN: r0=213(x1), r1=124(y1), r2=184(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 124
LDI r2, 184
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
