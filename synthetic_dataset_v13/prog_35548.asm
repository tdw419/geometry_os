; DESCRIPTION: Renders a blue line between points (103, 94) and (298, 172).
; PLAN: r0=103(x1), r1=94(y1), r2=298(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 94
LDI r2, 298
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
