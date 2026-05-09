; DESCRIPTION: Renders a cyan line between points (85, 168) and (424, 124).
; PLAN: r0=85(x1), r1=168(y1), r2=424(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 168
LDI r2, 424
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
