; DESCRIPTION: Renders a blue line between points (149, 121) and (228, 187).
; PLAN: r0=149(x1), r1=121(y1), r2=228(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 121
LDI r2, 228
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
