; DESCRIPTION: Renders a cyan line between points (236, 115) and (297, 71).
; PLAN: r0=236(x1), r1=115(y1), r2=297(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 115
LDI r2, 297
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
