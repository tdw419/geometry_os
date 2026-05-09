; DESCRIPTION: Renders a cyan line between points (115, 87) and (297, 16).
; PLAN: r0=115(x1), r1=87(y1), r2=297(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 87
LDI r2, 297
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
