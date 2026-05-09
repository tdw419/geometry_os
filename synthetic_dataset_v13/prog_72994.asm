; DESCRIPTION: Renders a blue line between points (366, 55) and (401, 243).
; PLAN: r0=366(x1), r1=55(y1), r2=401(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 55
LDI r2, 401
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
