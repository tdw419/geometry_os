; DESCRIPTION: Renders a blue line between points (380, 0) and (31, 186).
; PLAN: r0=380(x1), r1=0(y1), r2=31(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 0
LDI r2, 31
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
