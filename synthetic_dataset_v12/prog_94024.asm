; DESCRIPTION: Renders a blue line between points (243, 122) and (80, 178).
; PLAN: r0=243(x1), r1=122(y1), r2=80(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 122
LDI r2, 80
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
