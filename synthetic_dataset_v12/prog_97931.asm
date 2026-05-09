; DESCRIPTION: Renders a cyan line between points (411, 82) and (297, 32).
; PLAN: r0=411(x1), r1=82(y1), r2=297(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 82
LDI r2, 297
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
