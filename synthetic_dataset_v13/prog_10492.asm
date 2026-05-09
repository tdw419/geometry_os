; DESCRIPTION: Renders a cyan line between points (109, 255) and (342, 133).
; PLAN: r0=109(x1), r1=255(y1), r2=342(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 255
LDI r2, 342
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
