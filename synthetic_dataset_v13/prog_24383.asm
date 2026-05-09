; DESCRIPTION: Renders a blue line between points (456, 225) and (298, 199).
; PLAN: r0=456(x1), r1=225(y1), r2=298(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 225
LDI r2, 298
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
