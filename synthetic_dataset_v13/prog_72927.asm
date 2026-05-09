; DESCRIPTION: Renders a white line between points (179, 39) and (124, 216).
; PLAN: r0=179(x1), r1=39(y1), r2=124(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 39
LDI r2, 124
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
