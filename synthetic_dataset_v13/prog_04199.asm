; DESCRIPTION: Renders a cyan line between points (456, 133) and (179, 117).
; PLAN: r0=456(x1), r1=133(y1), r2=179(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 133
LDI r2, 179
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
