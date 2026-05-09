; DESCRIPTION: Renders a black line between points (49, 165) and (446, 13).
; PLAN: r0=49(x1), r1=165(y1), r2=446(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 165
LDI r2, 446
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
