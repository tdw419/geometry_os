; DESCRIPTION: Renders a black line between points (420, 216) and (103, 94).
; PLAN: r0=420(x1), r1=216(y1), r2=103(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 216
LDI r2, 103
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
