; DESCRIPTION: Renders a blue line between points (333, 116) and (303, 16).
; PLAN: r0=333(x1), r1=116(y1), r2=303(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 116
LDI r2, 303
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
