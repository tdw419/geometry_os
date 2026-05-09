; DESCRIPTION: Renders a cyan line between points (379, 179) and (305, 85).
; PLAN: r0=379(x1), r1=179(y1), r2=305(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 179
LDI r2, 305
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
