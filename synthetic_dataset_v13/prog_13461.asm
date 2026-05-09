; DESCRIPTION: Renders a white line between points (453, 124) and (55, 27).
; PLAN: r0=453(x1), r1=124(y1), r2=55(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 124
LDI r2, 55
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
