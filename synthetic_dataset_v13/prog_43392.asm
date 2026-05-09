; DESCRIPTION: Draws a blue line from (34, 130) to (446, 168).
; PLAN: r0=34(x1), r1=130(y1), r2=446(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 130
LDI r2, 446
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
