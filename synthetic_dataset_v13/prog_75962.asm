; DESCRIPTION: Renders a cyan line between points (297, 124) and (16, 102).
; PLAN: r0=297(x1), r1=124(y1), r2=16(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 124
LDI r2, 16
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
