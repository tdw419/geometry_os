; DESCRIPTION: Renders a green line between points (446, 165) and (14, 88).
; PLAN: r0=446(x1), r1=165(y1), r2=14(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 165
LDI r2, 14
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
