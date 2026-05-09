; DESCRIPTION: Renders a blue line between points (175, 116) and (100, 146).
; PLAN: r0=175(x1), r1=116(y1), r2=100(x2), r3=146(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 116
LDI r2, 100
LDI r3, 146
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
