; DESCRIPTION: Renders a blue line between points (298, 223) and (24, 5).
; PLAN: r0=298(x1), r1=223(y1), r2=24(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 223
LDI r2, 24
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
