; DESCRIPTION: Renders a blue line between points (47, 253) and (298, 37).
; PLAN: r0=47(x1), r1=253(y1), r2=298(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 253
LDI r2, 298
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
