; DESCRIPTION: Renders a blue line between points (175, 20) and (82, 146).
; PLAN: r0=175(x1), r1=20(y1), r2=82(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 20
LDI r2, 82
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
