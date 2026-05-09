; DESCRIPTION: Renders a blue line between points (226, 130) and (117, 16).
; PLAN: r0=226(x1), r1=130(y1), r2=117(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 130
LDI r2, 117
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
