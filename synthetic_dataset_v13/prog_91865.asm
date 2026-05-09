; DESCRIPTION: Renders a green line between points (268, 62) and (121, 124).
; PLAN: r0=268(x1), r1=62(y1), r2=121(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 62
LDI r2, 121
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
