; DESCRIPTION: Renders a cyan line between points (246, 133) and (207, 85).
; PLAN: r0=246(x1), r1=133(y1), r2=207(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 133
LDI r2, 207
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
