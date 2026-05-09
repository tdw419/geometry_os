; DESCRIPTION: Renders a cyan line between points (292, 255) and (99, 124).
; PLAN: r0=292(x1), r1=255(y1), r2=99(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 255
LDI r2, 99
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
