; DESCRIPTION: Renders a cyan line between points (246, 66) and (305, 216).
; PLAN: r0=246(x1), r1=66(y1), r2=305(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 66
LDI r2, 305
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
