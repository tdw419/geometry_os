; DESCRIPTION: Renders a cyan line between points (495, 231) and (158, 118).
; PLAN: r0=495(x1), r1=231(y1), r2=158(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 231
LDI r2, 158
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
