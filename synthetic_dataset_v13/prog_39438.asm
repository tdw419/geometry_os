; DESCRIPTION: Renders a blue line between points (38, 233) and (187, 24).
; PLAN: r0=38(x1), r1=233(y1), r2=187(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 233
LDI r2, 187
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
