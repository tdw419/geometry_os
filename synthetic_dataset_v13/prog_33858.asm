; DESCRIPTION: Renders a cyan line between points (168, 133) and (232, 135).
; PLAN: r0=168(x1), r1=133(y1), r2=232(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 133
LDI r2, 232
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
