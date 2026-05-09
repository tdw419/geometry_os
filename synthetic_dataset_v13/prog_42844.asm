; DESCRIPTION: Renders a cyan line between points (133, 13) and (38, 57).
; PLAN: r0=133(x1), r1=13(y1), r2=38(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 13
LDI r2, 38
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
