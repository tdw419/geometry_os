; DESCRIPTION: Renders a cyan line between points (247, 124) and (118, 53).
; PLAN: r0=247(x1), r1=124(y1), r2=118(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 124
LDI r2, 118
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
